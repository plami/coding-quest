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
    
    for(NSInteger pic = 1 ; pic <= 13 ;pic++){
        
        SKTexture* runRight = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldRight.png",(long)pic]];
        [self.playerRunRightTextures addObject:runRight];
        
        SKTexture* runLeft = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"player%ldLeft.png",(long)pic]];
        [self.playerRunLeftTextures addObject:runLeft];
    }
    
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
