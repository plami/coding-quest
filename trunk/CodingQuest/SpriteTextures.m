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

@end

@implementation SpriteTextures


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

-(void)createRunningAnimation{
    
    self.playerRunRightTextures = [[NSMutableArray alloc]init];
    self.playerRunLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger pic = 1 ; pic <= 13 ;pic++){
        
        SKTexture* runRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldRight.png",(long)pic]];
        [self.playerRunRightTextures addObject:runRight];
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldLeft.png",(long)pic]];
        [self.playerRunLeftTextures addObject:runLeft];
    }
    
}

-(void)createSkiddingAnimation{
    
    self.playerSkiddingLeftTextures = [[NSMutableArray alloc]init];
    SKTexture* skidLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player5LeftJump.png"]];
    
    [self.playerSkiddingLeftTextures addObject:skidLeft];
    
    self.playerSkiddingRightTextures = [[NSMutableArray alloc] init];
    SKTexture* skidRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player5RightJump.png"]];
    
    [self.playerSkiddingRightTextures addObject:skidRight];
    
}

-(void) createStillAnimation{
    
    self.playerStillFacingLeftTextures = [[NSMutableArray alloc] init];
    SKTexture* stillLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"playerStillLeft.png"]];
    
    [self.playerStillFacingLeftTextures addObject:stillLeft];
    
    self.playerStillFacingRightTextures = [[NSMutableArray alloc] init];
    SKTexture* stillRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"playerStillRight.png"]];
    
    [self.playerStillFacingRightTextures addObject:stillRight];
                            
}

-(void)createJumpingAnimation{
    
    self.playerJumpRightTextures = [[NSMutableArray alloc]init];
    self.playerJumpLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger picture = 1; picture <= 7; picture++){
        
        SKTexture* jumpRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldRightJump.png",(long)picture]];
        
        [self.playerJumpRightTextures addObject:jumpRight];
        SKTexture* jumpLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldLeftJump.png",(long)picture]];
        
        [self.playerJumpLeftTextures addObject:jumpLeft];
    }
    
}
@end
