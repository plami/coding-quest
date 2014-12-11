#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
@interface Monster : SKSpriteNode

+(Monster*) initNewMonster: (SKScene*)whichScene startingPoint:(CGPoint) location;
-(void) spawnInScene: (SKScene*) whichScene;
-(void) moveLeft;
-(void) shoot;
-(void) die;
-(void) addMonster;

@end
