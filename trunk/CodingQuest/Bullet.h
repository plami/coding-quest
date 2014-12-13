#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"
#import "Constants.h"

@interface Bullet : SKSpriteNode

+(Bullet*) initNewBullet3:(SKScene*) whichScene3 startingPoint:(CGPoint)location;

+(Bullet*) initNewBulletLeft3:(SKScene *)whichScene3 startingPoint:(CGPoint)location;

+(Bullet*) initNewAcidDown:(SKScene *)whichScene3 startingPoint:(CGPoint)location;

+(Bullet*) initNewAcidLeft:(SKScene *)whichScene3 startingPoint:(CGPoint)location;

-(void) shootRight;

-(void) shootLeft;

-(void) spitDown;

-(void) spitLeft;

@end
