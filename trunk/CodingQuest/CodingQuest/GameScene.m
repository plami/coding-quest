
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
             
             NSString* imageName = [NSString stringWithFormat:@"gameBackground.png"];
             Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:5];
             
             self.scrollingBackground = scrollingBackground;
             [self addChild: self.scrollingBackground];
            
             
    }
    return self;
    
}



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
  
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for(UITouch* touch in touches){
        
        CGPoint location = [touch locationInNode:self];
        
        if(!_player){
            
            _player  = [Player initNewPlayer:self startingPoint:CGPointMake(50, 100) ];
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
