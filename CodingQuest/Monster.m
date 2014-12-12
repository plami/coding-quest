#import "Monster.h"
#import "GameScene.h"
#import "SpriteTextures.h"

@interface Monster ()

@property SpriteTextures* spriteTextures;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@end

@implementation Monster

#define kMonsterHighSize        70
#define kMonsterWidthSize       70
#define kMonsterMovingLeftSpeed 80
#define kMonsterSpawnX          10
#define kMonsterSpawnY          100


+(Monster *)initNewMonster:(SKScene *)whichScene startingPoint :(CGPoint)location{
 
  
    SpriteTextures* monsterTexture = [[SpriteTextures alloc] init];
    
    [monsterTexture createMonsterRunningAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"bug1Moving.png"];
    NSLog(@"%ld",[monsterTexture.runLeftMonster count]);
    Monster* monster = [Monster spriteNodeWithTexture:f1];
  
    monster.spriteTextures = monsterTexture;
    monster.size = CGSizeMake(kMonsterWidthSize,kMonsterHighSize);
    [whichScene addChild:monster];
    return monster;
}

-(void)moveLeft{
    
    SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures runLeftMonster] timePerFrame:0.2];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
    SKAction* moveLeft = [SKAction moveByX:-kMonsterMovingLeftSpeed y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    [self runAction:moveForever];
    

}

-(void)spawnInScene:(SKScene *)whichScene{
    
   
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, whichScene.frame.size.height  -kMonsterSpawnY);
    
   [self moveLeft];
}


@end
