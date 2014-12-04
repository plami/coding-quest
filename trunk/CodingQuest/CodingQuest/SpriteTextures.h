#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SpriteTextures : NSObject

-(void) createRunningAnimation;
-(void) createJumpingAnimation;



-(NSMutableArray*) runningRight;
-(NSMutableArray*) runningLeft;

-(NSMutableArray*) jumpingRight;
-(NSMutableArray*) jumpingLeft;
@end


