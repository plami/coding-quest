#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"

@interface Bullet : SKSpriteNode

+(Bullet*) initNewBullet3:(SKScene*) whichScene3 startingPoint:(CGPoint)location;
+(Bullet*) initNewBulletLeft3:(SKScene *)whichScene3 startingPoint:(CGPoint)location;
-(void) shootRight;
-(void) shootLeft;

@end
