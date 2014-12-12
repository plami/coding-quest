#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"

@interface Bullet : SKSpriteNode
+(Bullet*) initNewBullet3:(GameSceneLevel3*) whichScene3 startingPoint:(CGPoint)location;
-(void) shoot;
@end
