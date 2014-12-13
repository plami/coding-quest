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
    
    coin.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:coin.frame.size.width/2];
    coin.physicsBody.friction = 0.0f;
    coin.physicsBody.restitution = 1.0f;
    coin.physicsBody.linearDamping = 0.0f;
    coin.physicsBody.allowsRotation = NO;
    coin.position = location;
    coin.physicsBody.dynamic = YES;
    coin.name = @"coin";
    
    NSLog(@"%f , %f",coin.position.x, coin.position.y);
    
    coin.physicsBody.categoryBitMask = coinCategory;
    coin.physicsBody.contactTestBitMask = playerCategory;
    coin.physicsBody.collisionBitMask = 0;
    
    [whichScene addChild:coin];
    
    return coin;
}


-(void) moveLeft{

    SKAction* moveLeft = [SKAction moveByX:-50 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    [self runAction:moveForever];

}

-(void)addedInScene:(SKScene *)whichScene{
    
    SKSpriteNode* object = [SKSpriteNode spriteNodeWithImageNamed:@"coin1.png"];
    object.size = CGSizeMake(40,40);
    object.position = CGPointMake(whichScene.frame.size.width,whichScene.frame.size.height/4);
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
