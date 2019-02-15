#include <ed25519/ed25519.h>

int main(int arc, char** argv) {
  public_key_t pub;
  private_key_t priv;

  ed25519_create_keypair(&priv, &pub);

  const int size      = 7;
  const char *buff = "ed25519";

  signature_t sig;
  ed25519_sign(&sig, (unsigned char*)buff, size, &pub, &priv);

  ed25519_verify(&sig, (unsigned char*)buff, size, &pub);
  // return 1 = ok

  return 0;
}
