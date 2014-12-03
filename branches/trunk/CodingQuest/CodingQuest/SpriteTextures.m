#import "SpriteTextures.h"


@implementation SpriteTextures

-(void)createAnimationTextures{
    
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"player1.png"];
    SKTexture* f2 = [SKTexture textureWithImageNamed:@"player2.png"];
    SKTexture* f3 = [SKTexture textureWithImageNamed:@"player3.png"];
    SKTexture* f4 = [SKTexture textureWithImageNamed:@"player4.png"];
    SKTexture* f5 = [SKTexture textureWithImageNamed:@"player5.png"];
    
    _playerRunRightTextures = @[f1,f2,f3,f4,f5];
}

@end
