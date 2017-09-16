// Using SDL2 to create an application window
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <iostream>
#include <assert.h>

int main(int argc, char* argv[])
{
    SDL_Init(SDL_INIT_VIDEO);   // Initialize SDL2
  
    SDL_Window *window;        // Declare a pointer to an SDL_Window
    SDL_Renderer* renderer;
  
    // Create an application window with the following settings:
    window = SDL_CreateWindow( 
        "An SDL2 window",         //    const char* title
        SDL_WINDOWPOS_UNDEFINED,  //    int x: initial x position
        SDL_WINDOWPOS_UNDEFINED,  //    int y: initial y position
        640,                      //    int w: width, in pixels
        480,                      //    int h: height, in pixels
        SDL_WINDOW_SHOWN          //    Uint32 flags: window options, see docs
    );

    renderer = SDL_CreateRenderer(window, -1, 0);
  
    // Check that the window was successfully made
    if(window==NULL)
    {   
        // In the event that the window could not be made...
        std::cout << "Could not create window: " << SDL_GetError() << '\n';
        SDL_Quit(); 
        return 1;
    } 
    
    assert(argc >= 2);
    
    SDL_Surface* surface = IMG_Load(argv[1]);
    if(surface == NULL)
    {
        std::cout << "Could not load image: " << SDL_GetError() << '\n';
        SDL_Quit(); 
        return 1;
    }

    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_FreeSurface(surface);

    
    bool done = false;
    SDL_Event e;

    while(!done)
    {
        while(SDL_PollEvent(&e) != 0 )
        {
            if( e.type == SDL_QUIT )
                done = true;
        }

        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_RenderClear(renderer);
        
        SDL_RenderCopy(renderer, texture, NULL, NULL);


        SDL_RenderPresent(renderer);
    }

    SDL_DestroyTexture(texture);
  
    // Close and destroy the window
    SDL_DestroyWindow(window); 
  
    // Clean up SDL2 and exit the program
    SDL_Quit(); 
    return 0;   
}
