#include <cryptopp/sha.h>
#include <cryptopp/hex.h>
#include <iostream>
#include <string>

int main() {
    CryptoPP::byte digest[ CryptoPP::SHA1::DIGESTSIZE ];
    std::string message = "abcdefghijklmnopqrstuvwxyz";

    CryptoPP::SHA1 hash;
    hash.CalculateDigest( digest, (const CryptoPP::byte*)message.c_str(), message.length() );

    CryptoPP::HexEncoder encoder;
    std::string output;

    encoder.Attach( new CryptoPP::StringSink( output ) );
    encoder.Put( digest, sizeof(digest) );
    encoder.MessageEnd();

    std::cout << output << std::endl;
}
