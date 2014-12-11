
#import "Monster.h"
#import "GameScene.h"
@implementation Monster

-(instancetype)initNewMonsters:(SKScene *)whichScene startingPoint:(CGPoint)location{
    
    SKTexture* monsterTexture = [SKTexture textureWithImage:@"asd"];
    Monster* monster = [Monster spriteNodeWithTexture:monsterTexture];
    
    monster.position = location;
    monster.physicsBody.linearDamping = 0.1;
    monster.physicsBody.allowsRotation = NO;
    
    
    [whichScene addChild:monster];
    return monster;
}

-(void)spawnInScene:(SKScene *)whichScene{
    
}
@end
