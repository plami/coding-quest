
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
      
        [self initializingFloor];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
    
}



-(void) initializingFloor{
    
    SKSpriteNode* floor = [SKSpriteNode spriteNodeWithImageNamed:@"ground.png"];
    
    
    floor.position = CGPointMake(330, 40);
    floor.size = CGSizeMake(self.frame.size.width, floor.size.height);
    floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
    floor.physicsBody.dynamic = NO;
    floor.physicsBody.affectedByGravity  = NO;
    
    [self addChild:floor];
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
  
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for(UITouch* touch in touches){
        
        CGPoint location = [touch locationInNode:self];
        
        if(!_player){
            
            _player  = [Player initNewPlayer:self startingPoint:location ];
        }
        else{
            [_player runRight];
        }
    }
   
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
