#import "SpriteTextures.h"
#import "Constants.h"

@interface SpriteTextures ()


@property NSMutableArray* playerRunLeftTextures;
@property NSMutableArray* playerStillFacingLeftTextures;
@property NSMutableArray* playerJumpLeftTextures;
@property NSMutableArray* playerSkiddingLeftTextures;

@property NSMutableArray* playerJumpRightTextures;
@property NSMutableArray* playerSkiddingRightTextures;
@property NSMutableArray* playerStillFacingRightTextures;
@property NSMutableArray* playerRunRightTextures;

@property NSMutableArray* leftMovingBug;
@property NSMutableArray* dyingBugTexture;


@property NSMutableArray* bulletShootRightTexture;
@property NSMutableArray* bulletShootLeftTexture;

@property NSMutableArray* acidShootDownTexture;
@property NSMutableArray* acidShootLeftTexture;

@property NSMutableArray* movingCoins;


@end

@implementation SpriteTextures


-(NSMutableArray *)dyingMonster{
    return self.dyingBugTexture;
}


-(NSMutableArray *)movingBonuses{
    return self.movingCoins;
}


-(NSMutableArray *)runLeftMonster{
    return self.leftMovingBug;
}


-(NSMutableArray *)runningRight{
    return self.playerRunRightTextures;
}


-(NSMutableArray *)jumpingRight{
    
    return self.playerJumpRightTextures;
}


-(NSMutableArray *)skiddingRight{
    return self.playerSkiddingRightTextures;
}


-(NSMutableArray *)stillRight{
    return self.playerStillFacingRightTextures;
}


-(NSMutableArray *)runningLeft{
    return self.playerRunLeftTextures;
}


-(NSMutableArray *)jumpingLeft{
    return self.playerJumpLeftTextures;
}


-(NSMutableArray *)skiddingLeft{
    return self.playerSkiddingLeftTextures;
}


-(NSMutableArray *)stillLeft{
    return self.playerStillFacingLeftTextures;
}


-(NSMutableArray *)shootingRight{
    return self.bulletShootRightTexture;
}

-(NSMutableArray *)spittingLeft{
    return self.acidShootLeftTexture;
}

-(NSMutableArray *)spittingDown{
    return self.acidShootDownTexture;
}
-(NSMutableArray *)shootingLeft{
    return self.bulletShootLeftTexture;
}


#pragma mark Animation for moving, dying and shooting of the Monster

-(void)createMonsterDyingAnimation{
    
    self.dyingBugTexture = [[NSMutableArray alloc] init];
    for(int pic = 1; pic  <= 2; ++pic){
        SKTexture* die = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"groundBug%ldHit.png",(long)pic]];
        
        [self.dyingBugTexture addObject: die];
    }
}


-(void)createMonsterRunningAnimation{
    
    self.leftMovingBug = [[NSMutableArray alloc]init];
    
    for(int pic = 1; pic <= kMonsterRunningAnimationNumber; ++pic){
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"groundBug%ldMoving.png",(long) pic]];
        
        [self.leftMovingBug addObject:runLeft];
    }
}


-(void)createSpittingLeftAnimation{
    self.acidShootLeftTexture = [[NSMutableArray alloc] init];
    SKTexture* shoot = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"acidAttackLeft.png"]];
    [self.acidShootLeftTexture addObject:shoot];
}


-(void)createSpittingDownAnimation{
    self.acidShootDownTexture = [[NSMutableArray alloc] init];
    SKTexture* shoot = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"acidAttackDown.png"]];
    [self.acidShootDownTexture addObject:shoot];
}


#pragma mark Animation for Bonus

-(void)createCoinAnimation{
    
    self.movingCoins = [[NSMutableArray alloc]init];
    
    for(int pic = 1; pic <= kCoinAnimation; ++pic){
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"coin%ld.png",(long) pic]];
        
        [self.movingCoins addObject:runLeft];
    }
}


#pragma mark Animation for moving, jumping and shooting of the Player

-(void)createRunningAnimation{
    
    self.playerRunRightTextures = [[NSMutableArray alloc]init];
    self.playerRunLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger pic = 1 ; pic <= kPlayerRunningAnimationNumber ;pic++){
        
        SKTexture* runRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerRunRightFrame,(long)pic]];
        [self.playerRunRightTextures addObject:runRight];
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerRunLeftFrame,(long)pic]];
        [self.playerRunLeftTextures addObject:runLeft];
    }
    
}


-(void)createSkiddingAnimation{
    
    self.playerSkiddingLeftTextures = [[NSMutableArray alloc]init];
    SKTexture* skidLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerLeftSkid]];
    
    [self.playerSkiddingLeftTextures addObject:skidLeft];
    
    self.playerSkiddingRightTextures = [[NSMutableArray alloc] init];
    SKTexture* skidRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerRightSkid]];
    
    [self.playerSkiddingRightTextures addObject:skidRight];
    
}


-(void) createStillAnimation{
    
    self.playerStillFacingLeftTextures = [[NSMutableArray alloc] init];
    SKTexture* stillLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerStillFacingLeft]];
    
    [self.playerStillFacingLeftTextures addObject:stillLeft];
    
    self.playerStillFacingRightTextures = [[NSMutableArray alloc] init];
    SKTexture* stillRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerStillFacingRight]];
    
    [self.playerStillFacingRightTextures addObject:stillRight];
                            
}


-(void)createJumpingAnimation{
    
    self.playerJumpRightTextures = [[NSMutableArray alloc]init];
    self.playerJumpLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger picture = 1; picture <= kPlayerJumpingAnimation; picture++){
        
        SKTexture* jumpRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerRightJump,(long)picture]];
        
        [self.playerJumpRightTextures addObject:jumpRight];
        SKTexture* jumpLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:kPlayerLeftJump,(long)picture]];
        
        [self.playerJumpLeftTextures addObject:jumpLeft];
    }
    
}


-(void)createShootingRightAnimation{

    self.bulletShootRightTexture = [[NSMutableArray alloc] init];
    SKTexture* shoot = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"bulletLevel2.png"]];
    [self.bulletShootRightTexture addObject:shoot];
}



-(void)createShootingLeftAnimation{
    self.bulletShootLeftTexture = [[NSMutableArray alloc] init];
    SKTexture* shoot = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"bulletLeft.png"]];
    [self.bulletShootLeftTexture addObject:shoot];
}


@end
