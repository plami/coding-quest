#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SpriteTextures : NSObject

-(void) createRunningAnimation;
-(void) createJumpingAnimation;
-(void) createSkiddingAnimation;
-(void) createStillAnimation;
-(void) createMonsterRunningAnimation;

-(NSMutableArray*) leftMovingBug;

-(NSMutableArray*) stillRight;
-(NSMutableArray*) stillLeft;

-(NSMutableArray*) skiddingRight;
-(NSMutableArray*) skiddingLeft;

-(NSMutableArray*) runningRight;
-(NSMutableArray*) runningLeft;

-(NSMutableArray*) jumpingRight;
-(NSMutableArray*) jumpingLeft;


@end


