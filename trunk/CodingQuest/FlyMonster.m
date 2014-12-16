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

-(Monster *)initNewMonster:(SKScene *)whichScene startingPoint:(CGPoint)location{
    
    SpriteTextures* monsterTexture = [[SpriteTextures alloc] init];
    
    [monsterTexture createFlyingAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"bug1.Moving.png"];
    FlyMonster* fly = [FlyMonster spriteNodeWithTexture:f1];
    
    [whichScene addChild:fly];
    return fly;
}
/*
-(void)die{
    SKAction* dieAction = [SKAction animateWithTextures:[_spriteTextures ] timePerFrame:0.5];
    
    [self runAction:dieAction];
}
*/
-(void)spawnInScene:(SKScene *)whichScene{
    
    self.position = CGPointMake(whichScene.frame.size.width + kMonsterSpawnX, whichScene.frame.size.height + kMonsterSpawnY);
    
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
