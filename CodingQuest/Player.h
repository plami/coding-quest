#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameSceneLevel2.h"

@interface Player : SKSpriteNode

+(Player*) initNewPlayer1:(GameScene*) whichScene1 startingPoint: (CGPoint) location;
+(Player*) initNewPlayer2:(GameSceneLevel2*) whichScene2 startingPoint:(CGPoint)location;

typedef enum: int{
    PlayerFacingLeft ,
    PlayerFacingRight,
    PlayerRunningLeft,
    PlayerRunningRight,
    PlayerSkiddingLeft,
    PlayerSkiddingRight,
    PlayerJumpingLeft,
    PlayerJumpingRight,
    PlayerJumpingUpFacingLeft,
    PlayerJumpingUpFacingRight
}PlayerStatus;


@property PlayerStatus playerStatus;

-(void) runOnPlace;
-(void) runRight;
-(void) runLeft;

-(void) jump;
-(void) skidRight;
-(void) skidLeft;
@end
