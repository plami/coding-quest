#import <Foundation/Foundation.h>

static const uint32_t playerCategory    = 0x1 << 0;  // 00000000000000000000000000000001
static const uint32_t coinCategory      = 0x1 << 1;  // 00000000000000000000000000000010
static const uint32_t bulletCategory    = 0x1 << 2;  // 00000000000000000000000000000100
static const uint32_t monsterCategory   = 0x1 << 3;  // 00000000000000000000000000001000

@protocol Constants <NSObject>

@end
