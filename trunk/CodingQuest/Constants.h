#import <Foundation/Foundation.h>

static const uint32_t playerCategory    = 0x1 << 0;      // 00000000000000000000000000000001
static const uint32_t coinCategory      = 0x1 << 1;      // 00000000000000000000000000000010
static const uint32_t bulletCategory    = 0x1 << 2;      // 00000000000000000000000000000100
static const uint32_t monsterCategory   = 0x1 << 3;      // 00000000000000000000000000001000
static const uint32_t monsterBulletCategory = 0X1 << 4;  // 00000000000000000000000000010000

@protocol Constants <NSObject>

#define kScoreName @"scoreDisplay"
#define kHealthName @"healthDisplay"
#define kLivesName @"livesDisplay"

#define kBackgroundsetScale 0.33

#define kCoinMinSize  40
#define kCoinMaxSize  40

#define kPlayerSizeHigh  70
#define kPlayerSizeWidth 50
#define kPlayerRunOnPlaceTimePerFrame 0.1
#define kPlayerRunOnRightSpeed 50
#define kPlayerRunOnLeftSpeed 80
#define kPlayerMoveUpLength 100
#define kPlayerMoveDownLength 100
#define kPlayerSkidRight 50
#define kPlayerSkidLeft 50
#define kPlayerLives 3

#define kMonsterRunningAnimationNumber                      4
#define kPlayerRunningAnimationNumber                       13
#define kPlayerJumpingAnimation                             7
#define kCoinAnimation                                      5
#define kPlayerRunRightFrame            @"player%ldRight.png"
#define kPlayerRunLeftFrame             @"player%ldLeft.png"
#define kPlayerLeftJump                 @"player%ldLeftJump.png"
#define kPlayerRightJump                @"player%ldRightJump.png"
#define kPlayerLeftSkid                 @"player5LeftJump.png"
#define kPlayerRightSkid                @"player5RightJump.png"
#define kPlayerStillFacingLeft          @"playerStillLeft.png"
#define kPlayerStillFacingRight         @"playerStillRight.png"

#define kMonsterHighSize        70
#define kMonsterWidthSize       70
#define kMonsterMovingLeftSpeed 80
#define kMonsterSpawnX          20
#define kMonsterSpawnY          60


@end
