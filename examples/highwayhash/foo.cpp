#include "highwayhash/sip_hash.h"
#include "highwayhash/state_helpers.h"
#include <string>

// Mimic single use in tensorflow/tensorflow//core/platform/default/strong_hash.h
inline std::uint64_t StrongKeyedHash(const std::uint64_t (&key)[2], const std::string& s) {
    return highwayhash::StringHasher<highwayhash::SipHashState>()(key, s);
}

int main() {
    return 0;
}
