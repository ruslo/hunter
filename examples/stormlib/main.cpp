#include <StormLib.h>
#include <stdio.h>

int ExtractFile(char * szArchiveName, char * szArchivedFile, char * szFileName)
{
    HANDLE hMpq   = NULL;          // Open archive handle
    HANDLE hFile  = NULL;          // Archived file handle
    FILE* handle = NULL;          // Disk file handle
    int    nError = ERROR_SUCCESS; // Result value

    // Open an archive, e.g. "d2music.mpq"
    if(nError == ERROR_SUCCESS)
    {
        if(!SFileOpenArchive(szArchiveName, 0, STREAM_FLAG_READ_ONLY, &hMpq))
            nError = GetLastError();
    }
    
    // Open a file in the archive, e.g. "data\global\music\Act1\tristram.wav"
    if(nError == ERROR_SUCCESS)            
    {
        if (!SFileOpenFileEx(hMpq, szArchivedFile, 0, &hFile))
            nError = GetLastError();
    }

    // Create the target file
    if(nError == ERROR_SUCCESS)
    {
        handle = fopen(szFileName, "wb");
        if (!handle)
            nError = -1;
    }

    // Read the file from the archive
    if(nError == ERROR_SUCCESS)
    {
        char  szBuffer[0x10000];
        DWORD dwBytes = 1;

        while(dwBytes > 0)
        {
            SFileReadFile(hFile, szBuffer, sizeof(szBuffer), &dwBytes, NULL);
            if (dwBytes > 0)
                fwrite(szBuffer, 1, dwBytes, handle);
        }
    }        

    // Cleanup and exit
    if (handle != NULL)
        fclose(handle);
    if(hFile != NULL)
        SFileCloseFile(hFile);
    if(hMpq != NULL)
        SFileCloseArchive(hMpq);

    return nError;
}

int main(int argc, char** argv)
{
    if (argc != 4)
        return -1;

    int err = ExtractFile(argv[1], argv[2], argv[3]);
    return err;
}
