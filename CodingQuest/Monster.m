
#import "Monster.h"
#import "GameScene.h"
#import "SpriteTextures.h"

@interface Monster ()

@property SpriteTextures* spriteTextures;

@end

@implementation Monster

+(Monster *)initNewMonster:(SKScene *)whichScene startingPoint :(CGPoint)location{
 
    SKTexture* bugTexture = [SKTexture textureWithImageNamed:@"bug1Moving.png"];
    SpriteTextures* monsterTexture = [[SpriteTextures alloc]init];
    Monster* monster = [Monster spriteNodeWithTexture:bugTexture ];
    [monsterTexture createMonsterRunningAnimation];
    
    monster.spriteTextures = monsterTexture;
    monster.size = CGSizeMake(70,70);
    monster.physicsBody.affectedByGravity = NO;
    monster.physicsBody.allowsRotation = NO;
    
    
    [whichScene addChild:monster];
    return monster;
}
/*
-(void)moveLeft{
  
    SKAction* walkAnimation = [SKAction animateWithTextures:[_spriteTextures leftMovingBug] timePerFrame:0.2];
    SKAction* walkForever = [SKAction repeatActionForever:walkAnimation ];
    [self runAction:walkForever];
    
    SKAction* moveLeft = [SKAction moveByX:-50 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft ];
    [self runAction:moveForever];

}
*/
-(void)spawnInScene:(SKScene *)whichScene{
    
    GameScene* gameScene = (GameScene*) whichScene;
    _spriteTextures = gameScene.spriteTextures;
    
    self.position = CGPointMake(whichScene.frame.size.width + 10, whichScene.frame.size.height /3 + whichScene.frame.size.height / 2);
    
    
   // [self moveLeft];
}


@end
