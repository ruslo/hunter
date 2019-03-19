#include <fp16.h>

int main() {
    // Test FP16
    const uint16_t min_po2_f16   = UINT16_C(0x0400);
    const float min_po2_value = fp16_ieee_to_fp32_value(min_po2_f16);

    const uint16_t positive_infinity_f16 = UINT16_C(0x7C00);
    const uint16_t negative_infinity_f16 = UINT16_C(0xFC00);

    const uint32_t positive_infinity_f32 = UINT32_C(0x7F800000);
    const uint32_t negative_infinity_f32 = UINT32_C(0xFF800000);


    return 0;
}
