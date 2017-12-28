#include <sha.h>
#include <hex.h>
#include <iostream>
#include <string>

int main() {
    byte digest[ CryptoPP::SHA::DIGESTSIZE ];
    std::string message = "abcdefghijklmnopqrstuvwxyz";
    
    CryptoPP::SHA hash;
    hash.CalculateDigest( digest, (const byte*)message.c_str(), message.length() );
    
    CryptoPP::HexEncoder encoder;
    std::string output;
    
    encoder.Attach( new CryptoPP::StringSink( output ) );
    encoder.Put( digest, sizeof(digest) );
    encoder.MessageEnd();
    
    std::cout << output << std::endl;
}
