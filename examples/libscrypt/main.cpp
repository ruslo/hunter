#include <libscrypt.h>

int main()
{
    const uint8_t password[] = "password";
    const uint8_t salt[] = "salt";
    uint8_t output[32];

    return libscrypt_scrypt(
        password,
        sizeof(password),
        salt,
        sizeof(salt),
        1,
        1,
        1,
        output,
        sizeof(output)
    );
}
