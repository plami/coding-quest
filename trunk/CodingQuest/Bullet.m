#import "Bullet.h"

@interface Bullet()
@property SpriteTextures* spriteTextures;
@end

@implementation Bullet


+(Bullet *)initNewBullet3:(SKScene *)whichScene3 startingPoint:(CGPoint)location{
    
    SpriteTextures* bulletTexture3 = [[SpriteTextures alloc]init];
    

    [bulletTexture3 createShootingRightAnimation];
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"bulletLevel2.png"];
    
    Bullet *bullet3 = [Bullet spriteNodeWithTexture:f3];
    bullet3.position = location;
    bullet3.spriteTextures = bulletTexture3;
    bullet3.size = CGSizeMake(10,20);
    
    bullet3.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:bullet3.frame.size.width/2];
    bullet3.physicsBody.friction = 0.0f;
    bullet3.physicsBody.restitution = 1.0f;
    bullet3.physicsBody.linearDamping = 0.0f;
    bullet3.physicsBody.allowsRotation = NO;
    bullet3.position = location;
    bullet3.physicsBody.dynamic = YES;
    bullet3.name = @"bullet";
    
    bullet3.physicsBody.categoryBitMask = bulletCategory;
    bullet3.physicsBody.contactTestBitMask = monsterCategory;
    bullet3.physicsBody.collisionBitMask = 0;
    
    
    [whichScene3 addChild:bullet3];
    
    return bullet3;
}

+(Bullet *)initNewBulletLeft3:(SKScene *)whichScene3 startingPoint:(CGPoint)location{
    
    SpriteTextures* bulletTexture3 = [[SpriteTextures alloc]init];

    
    [bulletTexture3 createShootingLeftAnimation];

    SKTexture* f3 = [SKTexture textureWithImageNamed:@"bulletLeft.png"];
    
    Bullet *bullet3 = [Bullet spriteNodeWithTexture:f3];
    bullet3.position = location;
    bullet3.spriteTextures = bulletTexture3;
    bullet3.size = CGSizeMake(10,20);
    
    bullet3.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:bullet3.frame.size.width/2];
    bullet3.physicsBody.friction = 0.0f;
    bullet3.physicsBody.restitution = 1.0f;
    bullet3.physicsBody.linearDamping = 0.0f;
    bullet3.physicsBody.allowsRotation = NO;
    bullet3.position = location;
    bullet3.physicsBody.dynamic = YES;
    bullet3.name = @"bullet";
    
    bullet3.physicsBody.categoryBitMask = bulletCategory;
    bullet3.physicsBody.contactTestBitMask = monsterCategory;
    bullet3.physicsBody.collisionBitMask = 0;
    
    [whichScene3 addChild:bullet3];
    
    return bullet3;
}




+(Bullet *)initNewAcidDown:(SKScene *)whichScene3 startingPoint:(CGPoint)location{
    SpriteTextures* acidTexture = [[SpriteTextures alloc]init];
    
    
    [acidTexture createSpittingLeftAnimation];
    
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"acidAttackLeft.png"];
    
    
    Bullet *acid = [Bullet spriteNodeWithTexture:f3];
    acid.position = location;
    acid.spriteTextures = acidTexture;
    acid.size = CGSizeMake(10,20);
    acid.physicsBody.affectedByGravity = NO;
    [whichScene3 addChild:acid];
    
    return acid;
}

+(Bullet *)initNewAcidLeft:(SKScene *)whichScene3 startingPoint:(CGPoint)location{
    SpriteTextures* acidTexture = [[SpriteTextures alloc]init];
    
    
    [acidTexture createSpittingDownAnimation];
    
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"acidAttackLeft.png"];
    
    
    Bullet *acid = [Bullet spriteNodeWithTexture:f3];
    acid.position = location;
    acid.spriteTextures = acidTexture;
    acid.size = CGSizeMake(10,20);
    acid.physicsBody.affectedByGravity = NO;
    [whichScene3 addChild:acid];
    
    return acid;
}

-(void)shootRight{
    
    SKAction* shootAction = [SKAction animateWithTextures:[_spriteTextures shootingRight] timePerFrame:0.1];
    SKAction* bulletMoveForever = [SKAction repeatActionForever:shootAction];
    [self runAction:bulletMoveForever];
    
    SKAction* moveRight = [SKAction moveByX:200 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveRight];
    
    [self runAction:moveForever];
}


-(void)shootLeft{
    
    SKAction* shootAction = [SKAction animateWithTextures:[_spriteTextures shootingLeft] timePerFrame:0.1];
    SKAction* bulletMoveForever = [SKAction repeatActionForever:shootAction];
    [self runAction:bulletMoveForever];
    
    SKAction* moveLeft = [SKAction moveByX:-200 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    
    [self runAction:moveForever];
}


-(void)spitDown{
    SKAction* shootAction = [SKAction animateWithTextures:[_spriteTextures spittingDown] timePerFrame:0.1];
    SKAction* acidMoveForever = [SKAction repeatActionForever:shootAction];
    [self runAction:acidMoveForever];
    
    SKAction* moveLeft = [SKAction moveByX:0 y:-50 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    
    [self runAction:moveForever];
}

-(void)spitLeft{
    SKAction* shootAction = [SKAction animateWithTextures:[_spriteTextures spittingLeft] timePerFrame:0.1];
    SKAction* acidMoveForever = [SKAction repeatActionForever:shootAction];
    [self runAction:acidMoveForever];
    
    SKAction* moveLeft = [SKAction moveByX:-50 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    
    [self runAction:moveForever];
}

@end
