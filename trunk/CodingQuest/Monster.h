#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
@interface Monster : SKSpriteNode

-(instancetype) initNewMonsters: (SKScene*) whichScene startingPoint: (CGPoint) location;

-(void) spawnInScene: (SKScene*) whichScene;
-(void) moveLeft;
-(void) shoot;
-(void) die;

@end
