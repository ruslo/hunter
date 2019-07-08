#include <stdio.h>
#include <readline/readline.h>

int main() {
  char *answer = readline("What is your name? ");

  printf("Hello, %s!\n", answer);
}
