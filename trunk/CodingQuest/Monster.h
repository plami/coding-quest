#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

typedef enum {
    flyingMonster, groundMonster
}MonsterType;

@interface Monster : SKSpriteNode

@property (readonly) MonsterType typeOfMonsters;

-(Monster*) initNewMonster: (SKScene*)whichScene;

-(void) spawnInScene: (SKScene*) whichScene;
-(void) moveLeft;
-(void) shoot: (SKScene*) scene;
-(void) die;


@end
