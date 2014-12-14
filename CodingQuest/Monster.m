#import "Monster.h"
#import "GameScene.h"
#import "SpriteTextures.h"
#import "GameOverScene.h"
#import "Constants.h"

#import "Bullet.h"

#import "Constants.h"

@interface Monster ()

@property SpriteTextures* spriteTextures;

@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property Monster* monster;
@property (readwrite) MonsterType typeOfMonsters;


@end

@implementation Monster


-(Monster *)initNewMonster:(SKScene *)whichScene{
 
  
    SpriteTextures* monsterTexture = [[SpriteTextures alloc] init];
    
    [monsterTexture createMonsterRunningAnimation];
    [monsterTexture createSpittingLeftAnimation];
    [monsterTexture createMonsterDyingAnimation];
    
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"groundBug1Moving.png"];
    Monster* monster = [Monster spriteNodeWithTexture:f1];
    monster.spriteTextures = monsterTexture;
    monster.size = CGSizeMake(kMonsterWidthSize,kMonsterHighSize);
    
    monster.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:monster.frame.size.width/2];
    monster.physicsBody.friction = 0.0f;
    monster.physicsBody.restitution = 1.0f;
    monster.physicsBody.linearDamping = 0.0f;
    monster.physicsBody.allowsRotation = NO;
    monster.physicsBody.dynamic = YES;
    monster.name = @"monster";
    
    //collision between monster and bullet
    monster.physicsBody.categoryBitMask = monsterCategory;
    monster.physicsBody.contactTestBitMask = bulletCategory;
    monster.physicsBody.collisionBitMask = 0;
    
    //collision between player and monster
    monster.physicsBody.categoryBitMask = monsterCategory;
    monster.physicsBody.contactTestBitMask = playerCategory;
    monster.physicsBody.collisionBitMask = 0;
    
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


-(void)die{
    SKAction* dieAction = [SKAction animateWithTextures:[_spriteTextures dyingMonster] timePerFrame:0.5];
    [self runAction:dieAction];
    
}


-(void)spawnInScene:(SKScene *)whichScene{
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, kMonsterSpawnY);
   [self moveLeft];
}

-(void)shoot:(SKScene*) scene{
    Bullet *leftAcit = [Bullet initNewAcidLeft:scene startingPoint:self.position];
    leftAcit.size = CGSizeMake(10, 20);
    [leftAcit shootLeft];
}


@end
