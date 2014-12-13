#import "Player.h"
#import "SpriteTextures.h"
@interface Player ()

@property SKTextureAtlas* runAtlas;
@property SpriteTextures* spriteTextures;


@end

@implementation Player

//putting the player in the Scene for Level 1

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


+(Player *)initNewPlayer1:(SKScene *)whichScene1 startingPoint:(CGPoint)location{
    
    SpriteTextures* playerTexture = [[SpriteTextures alloc]init];
    [playerTexture createRunningAnimation];
    [playerTexture createJumpingAnimation];
    [playerTexture createSkiddingAnimation];
    [playerTexture createStillAnimation];
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"playerStillRight.png"];
    
    Player *player1 = [Player spriteNodeWithTexture:f1];
    player1.position = location;
    player1.spriteTextures = playerTexture;
    player1.size = CGSizeMake(kPlayerSizeWidth, kPlayerSizeHigh);
    player1.physicsBody.affectedByGravity = YES;
    [whichScene1 addChild:player1];
    
    return player1;
}

//putting the player in the Scene for Level 2

+(Player *)initNewPlayer2:(GameSceneLevel2 *)whichScene2 startingPoint:(CGPoint)location{
    
    SpriteTextures* playerTexture2 = [[SpriteTextures alloc]init];
    [playerTexture2 createRunningAnimation];
    [playerTexture2 createJumpingAnimation];
    [playerTexture2 createSkiddingAnimation];
    [playerTexture2 createStillAnimation];
    SKTexture* f2 = [SKTexture textureWithImageNamed:@"playerStillRight.png"];
    
    Player *player2 = [Player spriteNodeWithTexture:f2];
    player2.position = location;
    player2.spriteTextures = playerTexture2;
    player2.size = CGSizeMake(kPlayerSizeWidth,kPlayerSizeHigh);
    player2.physicsBody.affectedByGravity = YES;
    [whichScene2 addChild:player2];
    
    return player2;
}

//putting the player in the Scene for Level 3

+(Player *)initNewPlayer3:(GameSceneLevel3 *)whichScene3 startingPoint:(CGPoint)location{
    
    SpriteTextures* playerTexture3 = [[SpriteTextures alloc]init];
    [playerTexture3 createRunningAnimation];
    [playerTexture3 createJumpingAnimation];
    [playerTexture3 createSkiddingAnimation];
    [playerTexture3 createStillAnimation];
    [playerTexture3 createShootingAnimation];
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"playerStillRight.png"];
    
    Player *player3 = [Player spriteNodeWithTexture:f3];
    player3.position = location;
    player3.spriteTextures = playerTexture3;
    player3.size = CGSizeMake(kPlayerSizeWidth,kPlayerSizeHigh);
    player3.physicsBody.affectedByGravity = YES;
    [whichScene3 addChild:player3];
    
    return player3;
}


-(void)runOnPlaceRight{
    SKAction* runAction = [SKAction animateWithTextures:[self.spriteTextures runningRight] timePerFrame:kPlayerRunOnPlaceTimePerFrame];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
}

-(void)runRight{

   [self runOnPlaceRight];
    
    SKAction* moveRight = [SKAction moveByX:kPlayerRunOnRightSpeed y:0 duration:1];
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
