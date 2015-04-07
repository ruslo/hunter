/*
 *  This file is part of WinSparkle (http://winsparkle.org)
 *
 *  This example code is public domain.
 *
 *
 *  Originally written by Vadim Zeitlin, modified by Vaclav Slavik.
 *
 *
 *  This program is intentionally as simple as possible and shouldn't be seen
 *  as an example of how to write a proper Win32 application (why should you
 *  want to do this anyhow when you have wxWidgets). It's just a test bed for
 *  WinSparkle.dll which it uses.
 *
 */

/*-------------------------------------------------------------------------*
   headers
 *-------------------------------------------------------------------------*/

#include "winsparkle.h"

#include <windows.h>
#include <windowsx.h>

#include <stdio.h>
#include <tchar.h>


/* force use of Common Controls 6 */
#ifdef _MSC_VER
#pragma comment(linker, "\"/manifestdependency:type='Win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='*' publicKeyToken='6595b64144ccf1df' language='*'\"")
#endif



/*-------------------------------------------------------------------------*
   constants
 *-------------------------------------------------------------------------*/

#define MAIN_WIN_CLASS_NAME    _TEXT("app_psdk_main_win_class")

#define IDB_CHECK_FOR_UPDATES   100


/*-------------------------------------------------------------------------*
   globals
 *-------------------------------------------------------------------------*/

HINSTANCE g_hInstance;
HWND g_hwndMain;


/*-------------------------------------------------------------------------*
   callbacks
 *-------------------------------------------------------------------------*/

void OnCheckForUpdates(HWND hwnd,
                       int id,
                       HWND hwndCtl,
                       UINT codeNotify)
{
    if ( id == IDB_CHECK_FOR_UPDATES )
    {
        win_sparkle_check_update_with_ui();
    }
}

void OnDestroy(HWND hwnd)
{
    /* Perform proper shutdown of WinSparkle. Notice that it's done while
       the main window is still visible, so that the app doesn't do 
       things when it appears to have quit already. */
    win_sparkle_cleanup();

    PostQuitMessage(0);
}

LRESULT CALLBACK MainWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch ( msg )
    {
        HANDLE_MSG(hwnd, WM_COMMAND, OnCheckForUpdates);
        HANDLE_MSG(hwnd, WM_DESTROY, OnDestroy);

        default:
            return DefWindowProc(hwnd, msg, wParam, lParam);
    }

    return 0;
}

/*-------------------------------------------------------------------------*
   initialization functions
 *-------------------------------------------------------------------------*/

int RegisterMainClass()
{
    WNDCLASS wc;
    ZeroMemory(&wc, sizeof(wc));
    wc.style         = CS_DBLCLKS | CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc   = MainWndProc;
    wc.hInstance     = g_hInstance;
    wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.lpszClassName = MAIN_WIN_CLASS_NAME;

    return RegisterClass(&wc) != 0;
}

int CreateMainWindow()
{
    g_hwndMain = CreateWindow
                 (
                    MAIN_WIN_CLASS_NAME,
                    _TEXT("WinSparkle example app using Platform SDK"),
                    WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT, CW_USEDEFAULT,
                    400, 300,
                    NULL, NULL, g_hInstance, NULL
                 );
    if ( !g_hwndMain )
        return FALSE;

    CreateWindow
    (
        _TEXT("static"),
        _TEXT("WinSparkle example"),
        WS_CHILD | WS_VISIBLE,
        10, 10, 200, 30,
        g_hwndMain, (HMENU)-1, g_hInstance, NULL
    );

    CreateWindow
    (
        _TEXT("button"),
        _TEXT("Check for updates manually"),
        WS_CHILD | WS_VISIBLE | BS_DEFPUSHBUTTON,
        100, 200, 250, 35,
        g_hwndMain, (HMENU)IDB_CHECK_FOR_UPDATES, g_hInstance, NULL
    );

    return TRUE;
}


/*-------------------------------------------------------------------------*
   entry point
 *-------------------------------------------------------------------------*/

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR lpCmdLine,
                     int nCmdShow)
{
    g_hInstance = hInstance;

    if ( !RegisterMainClass() )
        return 1;

    if ( !CreateMainWindow() )
        return 2;

    ShowWindow(g_hwndMain, nCmdShow);

    /* initialize WinSparkle as soon as the app itself is initialized, right
       before entering the event loop: */
    win_sparkle_init();

    {
        MSG msg;
        while ( GetMessage(&msg, NULL, 0, 0) )
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return 0;
}
