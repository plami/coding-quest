#import "SpriteTextures.h"

@interface SpriteTextures ()

@property NSMutableArray* playerRunRightTextures;
@property NSMutableArray* playerRunLeftTextures;
@property NSMutableArray* playerJumpRightTextures;
@property NSMutableArray* playerJumpLeftTextures;
@property NSMutableArray* playerSkiddingLeftTextures;
@property NSMutableArray* playerSkiddingRightTextures;
@property NSMutableArray* playerStillFacingRightTextures;
@property NSMutableArray* playerStillFacingLeftTextures;
@property NSMutableArray* leftMovingBug;
@end

@implementation SpriteTextures


#define kMonsterRunningAnimationNumber                      4
#define kPlayerRunningAnimationNumber                       13
#define kPlayerJumpingAnimation                             7
#define kPlayerRunRightFrame            @"player%ldRight.png"
#define kPlayerRunLeftFrame             @"player%ldLeft.png"
#define kPlayerLeftJump                 @"player%ldLeftJump.png"
#define kPlayerRightJump                @"player%ldRightJump.png"
#define kPlayerLeftSkid                 @"player5LeftJump.png"
#define kPlayerRightSkid                @"player5RightJump.png"
#define kPlayerStillFacingLeft          @"playerStillLeft.png"
#define kPlayerStillFacingRight         @"playerStillRight.png"

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

-(void)createMonsterRunningAnimation{
    
    self.leftMovingBug = [[NSMutableArray alloc]init];
    
    for(int pic = 1; pic <= kMonsterRunningAnimationNumber; ++pic){
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"bug%ldMoving.png",(long) pic]];
        
        [self.leftMovingBug addObject:runLeft];
    }
}

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
@end
