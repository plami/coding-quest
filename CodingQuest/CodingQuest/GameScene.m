
#import "GameScene.h"
#import "Player.h"

@interface GameScene ()
@property Player* player;
@property SKTextureAtlas* runAtlas;

@end

@implementation GameScene

-(instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    
    if(self){
        
        // [self initializingBackground];
        self.runAtlas = [SKTextureAtlas atlasNamed:@"Run"];
        [self loadPlayer];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
    
}


-(void) performRunningAnimation{
    
    NSMutableArray* frames = [[NSMutableArray alloc] init];
    NSInteger numberOfImages = self.runAtlas.textureNames.count;
    
    for(int index = 1; index <= numberOfImages; index++){
        
        NSString* textureName = [NSString stringWithFormat:@"player%d.png",index];
        SKTexture* temp = [self.runAtlas textureNamed: textureName];
        
        [frames addObject: temp];
    }
    
    SKAction* runAction = [SKAction animateWithTextures:frames timePerFrame:0.1f];
    SKAction* foreverRunning = [SKAction repeatActionForever:runAction];
    
    [self.player runAction:foreverRunning withKey:@"Run"];
}

-(void) loadPlayer{
    
    self.player = [[Player alloc]initWithImageNamed:@"player1.png"];
    self.player.position = CGPointMake(100,self.size.height / 2);
    self.player.size = CGSizeMake(100, 90);
    
    self.player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.player.size];
    self.player.physicsBody.mass = 1.0;
    self.player.physicsBody.affectedByGravity = NO;
    self.player.physicsBody.allowsRotation = NO;
    
    [self addChild:self.player];
    [self performRunningAnimation];

}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
   
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
