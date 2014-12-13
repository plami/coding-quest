#import "FlyMonster.h"
#import "SpriteTextures.h"

@interface FlyMonster ()


@property SpriteTextures* spriteTextures;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property FlyMonster* flyMonster;

@end
@implementation FlyMonster

-(Monster *)initNewMonster:(SKScene *)whichScene startingPoint:(CGPoint)location{
    
    SpriteTextures* monsterTexture = [[SpriteTextures alloc] init];
    
    [monsterTexture createMonsterRunningAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"bug1.Moving.png"];
    FlyMonster* fly = [FlyMonster spriteNodeWithTexture:f1];
    
    [whichScene addChild:fly];
    return fly;
}

@end
