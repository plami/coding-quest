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
    
    flyingMonster.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:flyingMonster.frame.size.width/2];
    flyingMonster.physicsBody.friction = 0.0f;
    flyingMonster.physicsBody.restitution = 1.0f;
    flyingMonster.physicsBody.linearDamping = 0.0f;
    flyingMonster.physicsBody.allowsRotation = NO;
    flyingMonster.physicsBody.dynamic = YES;
    flyingMonster.name = @"flying monster";
    
    //collision between monster and bullet, monster and player
    flyingMonster.physicsBody.categoryBitMask = monsterCategory;
    flyingMonster.physicsBody.contactTestBitMask = monsterBulletCategory | playerCategory;
    
    flyingMonster.physicsBody.collisionBitMask = 0;
    
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
    
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, whichScene.frame.size.height /2
                                + kMonsterSpawnY);
    
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
    [downAcid spitDown];
    
}

@end
