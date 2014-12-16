#import <Foundation/Foundation.h>
#include "Monster.h"
#import <SpriteKit/SpriteKit.h>

@interface FlyMonster : SKSpriteNode

-(FlyMonster*) initNewMonster: (SKScene*)whichScene;

-(void) spawnInScene: (SKScene*) whichScene;
-(void) moveLeft;
-(void) shoot: (SKScene*) scene;
-(void) die;

@end
