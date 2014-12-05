#import "Player.h"
#import "SpriteTextures.h"
@interface Player ()

@property SKTextureAtlas* runAtlas;
@property NSString* heroImage;

@property SpriteTextures* spriteTextures;
@end

@implementation Player


+(Player *)initNewPlayer:(GameScene *)whichScene startingPoint:(CGPoint)location{
    
    SpriteTextures* playerTexture = [[SpriteTextures alloc]init];
    [playerTexture createRunningAnimation];
    [playerTexture createJumpingAnimation];
    
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"player1.png"];
    
    Player *player = [Player spriteNodeWithTexture:f1];
    player.position = location;
    player.spriteTextures = playerTexture;
    player.physicsBody.affectedByGravity = YES;
    [whichScene addChild:player];
    return player;
    
}

-(void)jumpRight{
    
    SKAction* jumpAction = [SKAction animateWithTextures:[_spriteTextures jumpingRight] timePerFrame:0.3];
    [self runAction:jumpAction];
    
    SKAction *moveUp = [SKAction moveBy:CGVectorMake(0, 100) duration:0.8];
    
    SKAction *moveDown = [SKAction moveBy:CGVectorMake(0, -100) duration:0.6];
    SKAction *seq = [SKAction sequence:@[moveUp, moveDown]];
    
    [self runAction:seq];
    
}

-(void)runRight{
    
    SKAction* runAction = [SKAction animateWithTextures:[self.spriteTextures runningRight] timePerFrame:0.1];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
  
    SKAction* moveRight = [SKAction moveByX:100 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveRight];
    
    [self runAction:moveForever];
    
}

-(void) runLeft{
    SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures runningLeft] timePerFrame:0.1f];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
    SKAction* moveLeft = [SKAction moveByX:100 y:0 duration:1];
}



@end
