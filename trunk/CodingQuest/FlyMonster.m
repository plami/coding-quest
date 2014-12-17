#import "FlyMonster.h"
#import "SpriteTextures.h"
#import "Constants.h"
#import "Bullet.h"

@interface FlyMonster ()


@property SpriteTextures* spriteTextures;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property FlyMonster* flyMonster;

@end

@implementation FlyMonster

-(FlyMonster *)initNewMonster:(SKScene *)whichScene{

    SpriteTextures* monsterTexture = [[SpriteTextures alloc] init];
    
    [monsterTexture createFlyingAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"bug1Moving.png"];
    FlyMonster* flyingMonster = [FlyMonster spriteNodeWithTexture:f1];
    flyingMonster.spriteTextures = monsterTexture;
    flyingMonster.size = CGSizeMake(kFlyingMonsterWidthSize, kFlyingMonsterHighSize);
    
    [whichScene addChild:flyingMonster];
    return flyingMonster;

}

/*
-(void)die{
    SKAction* dieAction = [SKAction animateWithTextures:[_spriteTextures ] timePerFrame:0.5];
    
    [self runAction:dieAction];
}
*/

-(void)spawnInScene:(SKScene *)whichScene{
    
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, whichScene.frame.size.height /2 + kMonsterSpawnY);
    
    [self moveLeft];
}


-(void)moveLeft{
    
    SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures flyLeftMonster ] timePerFrame:0.2];
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
    SKAction* moveLeft = [SKAction moveByX: -kMonsterMovingLeftSpeed y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    
    [self runAction:moveForever];
}


-(void)shoot:(SKScene *)scene{
    
    Bullet* downAcid = [Bullet initNewAcidDown:scene startingPoint:self.position];
    
    downAcid.size = CGSizeMake(10, 20);
    
    downAcid.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:downAcid.frame.size.width/2];
    downAcid.physicsBody.friction = 0.0f;
    downAcid.physicsBody.restitution = 1.0f;
    downAcid.physicsBody.linearDamping = 0.0f;
    downAcid.physicsBody.allowsRotation = NO;
    downAcid.physicsBody.dynamic = YES;
    downAcid.name = @"flyingMonsterBullet";
    
    //collision between flying flyingMonster bullet and player
    downAcid.physicsBody.categoryBitMask = flyingMonsterBulletCategory;
    downAcid.physicsBody.contactTestBitMask = flyingMonsterBulletCategory | playerCategory;
    
    downAcid.physicsBody.collisionBitMask = 0;
    
    [downAcid spitDown];
}

@end
