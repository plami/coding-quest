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
    [playerTexture createAnimationTextures];
    
    SKTexture* f1 = [SKTexture textureWithImageNamed:@"player1.png"];
    
    Player *player = [Player spriteNodeWithTexture:f1];
    player.position = location;
    player.spriteTextures = playerTexture;
    player.physicsBody.affectedByGravity = YES;
    [whichScene addChild:player];
    return player;
    
}

-(void)runRight{
    
    SKAction* runAction = [SKAction animateWithTextures:_spriteTextures.playerRunRightTextures timePerFrame:0.1];
    
    SKAction* runForever = [SKAction repeatActionForever:runAction];
    [self runAction:runForever];
    
    SKAction* moveRight = [SKAction moveByX:100 y:0 duration:1];
    SKAction* moveForever = [SKAction repeatActionForever:moveRight];
    
    [self runAction:moveForever];
    
}

-(instancetype)initWithHeroImage:(NSString *)image{
    self = [super init];
    if(self){
        self.heroImage = image;
        self.runAtlas = [SKTextureAtlas atlasNamed:@"Run"];
    }
    return self;
}


@end
