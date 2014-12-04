#import "SpriteTextures.h"

@interface SpriteTextures ()
@property NSMutableArray* playerRunRightTextures;
@property NSMutableArray* playerRunLeftTextures;
@property NSMutableArray* playerJumpRightTextures;
@property NSMutableArray* playerJumpLeftTextures;
@end

@implementation SpriteTextures


-(NSMutableArray *)runningRight{
    return self.playerRunRightTextures;
}

-(NSMutableArray *)jumpingRight{
    
    return self.playerJumpRightTextures;
}

-(NSMutableArray *)runningLeft{
    return self.playerRunLeftTextures;
}

-(NSMutableArray *)jumpingLeft{
    return self.playerJumpLeftTextures;
}

-(void)createRunningAnimation{
    
    self.playerRunRightTextures = [[NSMutableArray alloc]init];
    self.playerRunLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger pic = 1 ; pic <= 12 ;pic++){
        
        SKTexture* runRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ld.png",(long)pic]];
        [self.playerRunRightTextures addObject:runRight];
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"leftPlayer%ld.png",(long)pic]];
        [self.playerRunLeftTextures addObject:runLeft];
    }
    
}

-(void)createJumpingAnimation{
    
    self.playerJumpRightTextures = [[NSMutableArray alloc]init];
    self.playerJumpLeftTextures = [[NSMutableArray alloc]init];
    
    for(NSInteger picture = 1; picture <= 5; picture++){
        
        SKTexture* jumpRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"jump%ld.png",(long)picture]];
        
        [self.playerJumpRightTextures addObject:jumpRight];
        SKTexture* jumpLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"leftJump%ld.png",(long)picture]];
        
        [self.playerRunLeftTextures addObject:jumpLeft];
    }
    
}
@end
