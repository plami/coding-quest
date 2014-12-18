#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"

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

@interface Player : SKSpriteNode

@property (readonly)PlayerStatus playerStatus;
@property (readonly)NSInteger playerLives;

+(Player*) initNewPlayer:(SKScene*) whichScene1 startingPoint: (CGPoint) location;
+(id) sharedPlayer;

-(NSInteger) randomPlace: (SKScene*) scene;
-(void) runOnPlaceRight;
-(void) runRight;
-(void) runLeft;
-(void) jump;
-(void) skidRight;
-(void) skidLeft;
-(void) runOnPlaceLeft;


@end
