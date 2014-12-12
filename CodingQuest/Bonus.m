#import "Bonus.h"

@interface Bonus ()

@property SpriteTextures* spriteTextures;

@end

@implementation Bonus

+(Bonus *)initNewBonus:(SKScene *)whichScene startingPoint :(CGPoint)location{
    
    SKTexture* coinTexture = [SKTexture textureWithImageNamed:@"coin1.png"];
    SpriteTextures* bonusTexture = [[SpriteTextures alloc]init];
    Bonus* coin = [Bonus spriteNodeWithTexture:coinTexture ];
    [bonusTexture runningLeft];
    [bonusTexture.movingBonuses count];
    coin.spriteTextures = bonusTexture;
    coin.size = CGSizeMake(whichScene.frame.size.width/15,whichScene.frame.size.height/10);
    coin.physicsBody.affectedByGravity = NO;
    coin.physicsBody.allowsRotation = NO;
    
    
    [whichScene addChild:coin];
    
    return coin;
}


-(void) moveLeft{
    
    SKAction* moveLeft = [SKAction moveByX:-50 y:0 duration:2];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    [self runAction:moveForever];

}

-(void)addedInScene:(SKScene *)whichScene{
    
    GameScene* gameScene = (GameScene*) whichScene;
    _spriteTextures = gameScene.spriteTextures;
    
    SKSpriteNode* object = [SKSpriteNode spriteNodeWithImageNamed:@"coin1.png"];
    object.size = CGSizeMake(40,40);
    object.position = CGPointMake(whichScene.frame.size.width,whichScene.frame.size.height/2);
    [self addChild: object];
    
    SKAction* move = [SKAction moveToX:-50 duration: 1];
    [object runAction: move completion:^{
        [object removeFromParent];
    }];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}


@end
