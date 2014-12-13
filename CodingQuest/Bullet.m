//
//  Bullet.m
//  CodingQuest
//
//  Created by User-26 on 12/12/14.
//  Copyright (c) 2014 User-06. All rights reserved.
//

#import "Bullet.h"
@interface Bullet()
@property SpriteTextures* spriteTextures;
@end
@implementation Bullet
+(Bullet *)initNewBullet3:(SKScene *)whichScene3 startingPoint:(CGPoint)location{
    SpriteTextures* bulletTexture3 = [[SpriteTextures alloc]init];
    
    [bulletTexture3 createShootingAnimation];
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"bulletLevel2.png"];
    
    Bullet *bullet3 = [Bullet spriteNodeWithTexture:f3];
    bullet3.position = location;
    bullet3.spriteTextures = bulletTexture3;
    bullet3.size = CGSizeMake(10,20);
    bullet3.physicsBody.affectedByGravity = NO;
    [whichScene3 addChild:bullet3];
    
    return bullet3;
}
-(void)shoot{
        
    SKAction* shootAction = [SKAction animateWithTextures:[_spriteTextures shooting] timePerFrame:0.1];
    SKAction* bulletMoveForever = [SKAction repeatActionForever:shootAction];
    [self runAction:bulletMoveForever];
    
    SKAction* moveRight = [SKAction moveByX:200 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveRight];
    
    [self runAction:moveForever];
    
    
}
@end
