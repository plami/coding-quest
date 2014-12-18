#import <Foundation/Foundation.h>

static const uint32_t playerCategory               = 0x1 << 0;      // 0000001
static const uint32_t coinCategory                 = 0x1 << 1;      // 0000010
static const uint32_t bulletCategory               = 0x1 << 2;      // 0000100
static const uint32_t monsterCategory              = 0x1 << 3;      // 0001000
static const uint32_t monsterBulletCategory        = 0X1 << 4;      // 0010000
static const uint32_t flyingMonsterBulletCategory  = 0X1 << 5;      // 0100000
static const uint32_t bottomCategory               = 0x1 << 1;      // 1000000

@protocol Constants <NSObject>

#define kScoreName                          @"scoreDisplay"
#define kHealthName                         @"healthDisplay"
#define kLivesName                          @"livesDisplay"
#define kPlayerRunRightFrame                @"player%ldRight.png"
#define kPlayerRunLeftFrame                 @"player%ldLeft.png"
#define kPlayerLeftJump                     @"player%ldLeftJump.png"
#define kPlayerRightJump                    @"player%ldRightJump.png"
#define kPlayerLeftSkid                     @"player5LeftJump.png"
#define kPlayerRightSkid                    @"player5RightJump.png"
#define kPlayerStillFacingLeft              @"playerStillLeft.png"
#define kPlayerStillFacingRight             @"playerStillRight.png"

#define kBackgroundsetScale                 0.33

#define kCoinMinSize                        40
#define kCoinMaxSize                        40

#define kPlayerSizeHigh                     70
#define kPlayerSizeWidth                    50
#define kPlayerRunOnPlaceTimePerFrame       0.1
#define kPlayerRunOnRightSpeed              50
#define kPlayerRunOnLeftSpeed               80
#define kPlayerMoveUpLength                 100
#define kPlayerMoveDownLength               100
#define kPlayerSkidRight                    50
#define kPlayerSkidLeft                     50
#define kPlayerLives                        3

#define kMonsterRunningAnimationNumber      4
#define kPlayerRunningAnimationNumber       13
#define kPlayerJumpingAnimation             7
#define kCoinAnimation                      5

#define kMonsterHighSize                    70
#define kMonsterWidthSize                   70
#define kFlyingMonsterHighSize              70
#define kFlyingMonsterWidthSize             70
#define kMonsterMovingLeftSpeed             80
#define kMonsterSpawnX                      20
#define kMonsterSpawnY                      60


@end
