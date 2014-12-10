
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
             Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:1];
             
             self.scrollingBackground = scrollingBackground;
             [self addChild: self.scrollingBackground];
             [self.scrollingBackground setScale:1.7];
             _player  = [Player initNewPlayer1:self startingPoint:CGPointMake(20, 60) ];
            [_player runOnPlace];
    }
    return self;
    
}



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
  
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for(UITouch* touch in touches){
        
        CGPoint location = [touch locationInNode:self];
        
        if(location.x < self.size.width / 2 && location.y < self.size.height / 2){
            
            [_player runLeft];
        }
        else if(  location.x > self.size.width / 2 && location.y < self.size.height / 2){
            [_player runRight];
        }
        else if([_player runLeft] && self.size.height / 2 > location.y){
            [_player jump];
        }
        else if([_player runRight] && location.y > self.size.height / 2){
            [_player jump];
        }
    }
}


-(void)update:(CFTimeInterval)currentTime {
    
    [self.scrollingBackground update:currentTime];

    if(_player.position.x > self.size.width - 10){
        [_player runLeft];
    }
    if(_player.position.x < 10){
        [_player runRight];
    }
}


@end
