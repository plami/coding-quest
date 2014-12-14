#import "Player.h"
#import "SpriteTextures.h"
@interface Player ()

@property SKTextureAtlas* runAtlas;
@property SpriteTextures* spriteTextures;
@property (readwrite)PlayerStatus playerStatus;
@property NSInteger playerLives;
@end

@implementation Player

//putting the player in the Scene for Level 1
#define kPlayerLives     3
#define kPlayerSizeHigh  70
#define kPlayerSizeWidth 50
#define kPlayerRunOnPlaceTimePerFrame 0.1
#define kPlayerRunOnRightSpeed 50
#define kPlayerRunOnLeftSpeed 80
#define kPlayerMoveUpLength 100
#define kPlayerMoveDownLength 100
#define kPlayerSkidRight 50
#define kPlayerSkidLeft 50


//putting the player in the Scene for Level 1


+(Player *)initNewPlayer:(SKScene *)whichScene1 startingPoint:(CGPoint)location{
    
    SpriteTextures* playerTexture = [[SpriteTextures alloc]init];
    [playerTexture createRunningAnimation];
    [playerTexture createJumpingAnimation];
    [playerTexture createSkiddingAnimation];
    [playerTexture createStillAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"playerStillRight.png"];
    
    Player *player = [Player spriteNodeWithTexture:f1];
    player.position = location;
    player.spriteTextures = playerTexture;
    player.size = CGSizeMake(kPlayerSizeWidth, kPlayerSizeHigh);
    player.physicsBody.affectedByGravity = YES;
    [whichScene1 addChild:player];
    player.playerStatus = PlayerFacingRight;
    player.playerLives = kPlayerLives;
    return player;
}


-(void)runOnPlaceRight{
    SKAction* runAction = [SKAction animateWithTextures:[self.spriteTextures runningRight] timePerFrame:kPlayerRunOnPlaceTimePerFrame];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
}


-(void) runRight{

   [self runOnPlaceRight];
    _playerStatus = PlayerRunningRight;
    SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures runningRight] timePerFrame:0.1f];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
    SKAction* moveRight = [SKAction moveByX:kPlayerRunOnLeftSpeed y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveRight];
    
    [self runAction:moveForever];
    _playerStatus = PlayerRunningRight;
    
}


-(void)skidRight{
    
    [self removeAllActions];
    _playerStatus = PlayerSkiddingRight ;
    
    SKAction* skidAnimation = [SKAction animateWithTextures:[_spriteTextures skiddingRight] timePerFrame:1];
    SKAction* skidAwhile = [SKAction repeatAction:skidAnimation count:0.2];
    
    SKAction* moveRight = [SKAction moveByX:kPlayerSkidRight y:0 duration:1];
    SKAction* moveAwile = [SKAction repeatAction:moveRight count:1];
    
    SKAction* stillAnimation = [SKAction animateWithTextures:[_spriteTextures stillRight] timePerFrame:1];
    
    SKAction* stillAwhile = [SKAction repeatAction:stillAnimation count:0.1];
    
    SKAction* sequence = [SKAction sequence:@[skidAwhile, moveAwile, stillAwhile]];

    SKAction* group = [SKAction group:@[sequence]];
   
    [self runAction:group completion:^{
        
        _playerStatus = PlayerFacingRight;
    }];
    
    
}

-(void)skidLeft{

    [self removeAllActions];
    _playerStatus = PlayerSkiddingRight ;
    
    SKAction* skidAnimation = [SKAction animateWithTextures:[_spriteTextures skiddingLeft] timePerFrame:1];
    SKAction* skidAwhile = [SKAction repeatAction:skidAnimation count:0.2];
    
    SKAction* moveLeft = [SKAction moveByX:-kPlayerSkidLeft y:0 duration:1];
    SKAction* moveAwile = [SKAction repeatAction:moveLeft count:1];
    
    SKAction* stillAnimation = [SKAction animateWithTextures:[_spriteTextures stillLeft] timePerFrame:1];
    
    SKAction* stillAwhile = [SKAction repeatAction:stillAnimation count:0.1];
    
    SKAction* sequence = [SKAction sequence:@[skidAwhile, moveAwile, stillAwhile]];
    
    SKAction* group = [SKAction group:@[sequence]];
    
    [self runAction:group completion:^{
        
        _playerStatus = PlayerFacingLeft;
        
    }];

    
}

-(void)runOnPlaceLeft{
    SKAction* runAction = [SKAction animateWithTextures:[_spriteTextures runningLeft] timePerFrame:0.1f];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
}

-(void) runLeft{
    
    [self runOnPlaceLeft];
    _playerStatus = PlayerRunningLeft;
    SKAction* moveLeft = [SKAction moveByX:-kPlayerRunOnLeftSpeed y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveLeft];
    
    [self runAction:moveForever];
    _playerStatus = PlayerRunningLeft;

}


-(void)jump{
    
    PlayerStatus nextPlayerStatus = 0;
    NSArray* playerJumpTexture = nil;
    
    if(self.playerStatus == PlayerRunningLeft || self.playerStatus == PlayerSkiddingLeft){
        
        self.playerStatus = PlayerJumpingLeft;
        playerJumpTexture = _spriteTextures.jumpingLeft;
        nextPlayerStatus = PlayerRunningLeft;
    }
    else if(self.playerStatus == PlayerRunningRight || self.playerStatus == PlayerSkiddingRight){
        
        self.playerStatus = PlayerJumpingRight;
        playerJumpTexture = _spriteTextures.jumpingRight;
        nextPlayerStatus = PlayerRunningRight;
    }
    else if(self.playerStatus == PlayerFacingLeft){
        self.playerStatus = PlayerJumpingUpFacingLeft;
        playerJumpTexture = _spriteTextures.jumpingLeft;
        nextPlayerStatus = PlayerFacingRight;
    }
    else if(self.playerStatus == PlayerFacingRight){
        self.playerStatus = PlayerJumpingUpFacingRight;
        playerJumpTexture = _spriteTextures.jumpingRight;
        nextPlayerStatus = PlayerFacingRight;
    }
    else{
        NSLog(@"invalid value :/");
    }
    
    
    SKAction* jumpAnimation = [SKAction animateWithTextures:playerJumpTexture timePerFrame:0.2];
    [self runAction:jumpAnimation];
    
    SKAction *moveUp = [SKAction moveBy:CGVectorMake(0, kPlayerMoveUpLength) duration:0.8];
    
    SKAction *moveDown = [SKAction moveBy:CGVectorMake(0, -kPlayerMoveDownLength) duration:0.6];
    SKAction *seq = [SKAction sequence:@[moveUp, moveDown]];
    
    [self runAction:seq];
    SKAction* jumpAwhile = [SKAction repeatAction:jumpAnimation count:1];
    SKAction* groupedJump = [SKAction group:@[jumpAwhile]];
    

    [self runAction:groupedJump completion:^{
        
        if(nextPlayerStatus == PlayerRunningLeft){
            [self removeAllActions];
            [self runLeft];

        }
        else if(nextPlayerStatus == PlayerRunningRight){
            [self removeAllActions];
            [self runRight];
        }
        else if(nextPlayerStatus == PlayerFacingLeft){
            NSArray* playerStillTextures = _spriteTextures.stillLeft;
            
            SKAction* stillAnimation = [SKAction animateWithTextures:playerStillTextures timePerFrame:1];
            SKAction* stilAwile = [SKAction repeatAction:stillAnimation count:0.1];
            
            [self runAction:stilAwile];
            self.playerStatus = PlayerFacingLeft;
        }
        else if(nextPlayerStatus == PlayerFacingRight){
            NSArray* playerStillTextures = _spriteTextures.stillRight;
            
            SKAction* stillAnimation = [SKAction animateWithTextures:playerStillTextures timePerFrame:1];
            SKAction* stilAwile = [SKAction repeatAction:stillAnimation count:0.1];
            
            [self runAction:stilAwile];
            self.playerStatus = PlayerFacingRight;
        }
        else{
            NSLog(@"something went wrong :<");
        }
    }];
    
}



@end
