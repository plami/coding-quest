
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
 
    SKTexture* bugTexture = [SKTexture textureWithImageNamed:@"bug1Moving.png"];
    SpriteTextures* monsterTexture = [[SpriteTextures alloc]init];
    Monster* monster = [Monster spriteNodeWithTexture:bugTexture ];
    [monsterTexture runningLeft];
    [monsterTexture.runLeftMonster count];
    monster.spriteTextures = monsterTexture;
    monster.size = CGSizeMake(kMonsterWidthSize,kMonsterHighSize);
    monster.physicsBody.affectedByGravity = NO;
    monster.physicsBody.allowsRotation = NO;
    
    
    [whichScene addChild:monster];
    return monster;

}

-(void)moveLeft{
    
   /* SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures runLeftMonster] timePerFrame:0.1f];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    */
    SKAction* moveLeft = [SKAction moveByX:-kMonsterMovingLeftSpeed y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    [self runAction:moveForever];
    

}

-(void)spawnInScene:(SKScene *)whichScene{
    
    GameScene* gameScene = (GameScene*) whichScene;
    _spriteTextures = gameScene.spriteTextures;
    
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, whichScene.frame.size.height  -kMonsterSpawnY);
    
   [self moveLeft];
}


@end
