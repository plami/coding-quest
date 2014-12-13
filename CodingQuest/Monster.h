#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
@interface Monster : SKSpriteNode

typedef enum {
    flyingMonster, groundMonster
}MonsterType;

-(Monster*) initNewMonster: (SKScene*)whichScene startingPoint:(CGPoint) location;

@property MonsterType typeOfMonsters;

-(void) spawnInScene: (SKScene*) whichScene;
-(void) moveLeft;
-(void) shoot;
-(void) die;
-(void) addMonsterAtScene: (SKScene*) scene forTime: (CFTimeInterval) timeSinceLastMonster;

@end
