#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SpriteTextures : NSObject

-(void) createRunningAnimation;
-(void) createJumpingAnimation;
-(void) createSkiddingAnimation;
-(void) createStillAnimation;
-(void) createMonsterRunningAnimation;
-(void)createCoinAnimation;

-(NSMutableArray*) runLeftMonster;
-(NSMutableArray*) movingBonuses;

-(NSMutableArray*) stillRight;
-(NSMutableArray*) stillLeft;

-(NSMutableArray*) skiddingRight;
-(NSMutableArray*) skiddingLeft;

-(NSMutableArray*) runningRight;
-(NSMutableArray*) runningLeft;

-(NSMutableArray*) jumpingRight;
-(NSMutableArray*) jumpingLeft;

-(NSMutableArray*) shooting;
-(void) createShootingAnimation;


@end


