#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

typedef enum {
    flyingMonster, groundMonster
}MonsterType;

@interface Monster : SKSpriteNode

@property (readonly) MonsterType typeOfMonsters;

-(Monster*) initNewMonster: (SKScene*)whichScene startingPoint:(CGPoint) location;

-(void) spawnInScene: (SKScene*) whichScene;

-(void) moveLeft;

-(void) shootAtSceen: (SKScene*) scene;


-(void) shoot;


-(void) die;


-(void) addMonsterAtScene: (SKScene*) scene forTime: (CFTimeInterval) timeSinceLastMonster;


@end
