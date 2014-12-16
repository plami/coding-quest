#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SpriteTextures : NSObject

-(void) createRunningAnimation;

-(void) createJumpingAnimation;

-(void) createSkiddingAnimation;

-(void) createStillAnimation;

-(void) createMonsterRunningAnimation;

-(void) createCoinAnimation;

-(void) createMonsterDyingAnimation;

-(void) createFlyingAnimation;

-(void) createShootingRightAnimation;

-(void) createShootingLeftAnimation;

-(void) createSpittingDownAnimation;

-(void) createSpittingLeftAnimation;


-(NSMutableArray*) runLeftMonster;

-(NSMutableArray*) dyingMonster;

-(NSMutableArray*) movingBonuses;

-(NSMutableArray*) runLeftGroundMonster;

-(NSMutableArray*) stillRight;

-(NSMutableArray*) stillLeft;

-(NSMutableArray*) skiddingRight;

-(NSMutableArray*) skiddingLeft;

-(NSMutableArray*) runningRight;

-(NSMutableArray*) runningLeft;

-(NSMutableArray*) jumpingRight;

-(NSMutableArray*) jumpingLeft;

-(NSMutableArray*) shootingRight;

-(NSMutableArray*) shootingLeft;

-(NSMutableArray*) spittingDown;

-(NSMutableArray*) spittingLeft;


@end


