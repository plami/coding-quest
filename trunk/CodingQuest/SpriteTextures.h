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
//-(void) createGroundMonsterAnimation;

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
-(void) createShootingRightAnimation;

-(NSMutableArray*) shootingLeft;
-(void) createShootingLeftAnimation;

@end


