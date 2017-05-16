#include <tomcrypt.h>
int main(void)
{
    unsigned char buffer[100], hash[MAXBLOCKSIZE];
    int idx, x;
    hash_state md;

    /* register hashes .... */
    if (register_hash(&md5_desc) == -1) {
        printf("Error registering MD5.\n");
        return -1;
    }

    /* register other hashes ... */
    /* prompt for name and strip newline */
    printf("Enter hash name: \n");
    fgets(buffer, sizeof(buffer), stdin);
    buffer[strlen(buffer) - 1] = 0;

    /* get hash index */
    idx = find_hash(buffer);
    if (idx == -1) {
        printf("Invalid hash name!\n");
        return -1;
    }

    /* hash input until blank line */
    hash_descriptor[idx].init(&md);
    while (fgets(buffer, sizeof(buffer), stdin) != NULL)
        hash_descriptor[idx].process(&md, buffer, strlen(buffer));

    hash_descriptor[idx].done(&md, hash);

   /* dump to screen */
   for (x = 0; x < hash_descriptor[idx].hashsize; x++)
     printf("%02x ", hash[x]);

   printf("\n");
   return 0;
}
