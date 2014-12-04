
#import "GameScene.h"
#import "Player.h"
#import "Background.h"


@interface GameScene ()
@property Player* player;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;
@end

@implementation GameScene
NSTimeInterval _lastUpdateTime;
NSTimeInterval _dt;
CGPoint _velocity;


-(instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    
    if(self){
      
        self.backgroundColor = [SKColor whiteColor];
        for (int i=1; i<=2; i++)
        {
            NSString* imageName =[NSString stringWithFormat:@"gameBackground%d.png",i];
            
            self.scrollingBackground = [[Background alloc]initWithBackground:imageName size:size speed:5.0];
            [self addChild: self.scrollingBackground];
            
//            SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"gameBackground1.png"];
//            //background.position = CGPointMake(self.size.width/2, self.size.height/2);
//            background.position = CGPointMake((i*background.size.width)+background.size.width/2, background.size.height/2);
//            //background.position = CGPointZero; //In a Mac machine makes the center of the image positioned at lower left corner. Untill and unless specified this is the default position
//            background.name =@"background";
//            [self addChild:background];
        }
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
   

    [self.scrollingBackground update:currentTime];
}
@end
