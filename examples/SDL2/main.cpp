#include<iostream>
#include<SDL2/SDL.h>

int main(int argc, char **argv){

    if (SDL_Init(SDL_INIT_TIMER) != 0){
        std::cout << "Error while initializing SDL: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return -1;
    }

    SDL_Quit();

    return 0;
}
