#import "GameSceneLevel2.h"
#import "Player.h"
#import "Background.h"

@interface GameSceneLevel2 ()

@property Player* player;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;

@end

@implementation GameSceneLevel2
NSTimeInterval _lastUpdateTime;
NSTimeInterval _dt;
CGPoint _velocity;

-(instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    if(self){
        
        self.backgroundColor = [SKColor whiteColor];
        
        NSString* imageName = [NSString stringWithFormat:@"backgroundLevel2.jpeg"];
        Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:2];
        self.scrollingBackground.scale = 0.5;
        
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
            
            _player  = [Player initNewPlayer2:self startingPoint:CGPointMake(40, 60)];
        }
        else{
          //  [_player runRight];
          //  [_player jumpRight];
        }
    }
}


-(void)update:(CFTimeInterval)currentTime {
    
    [self.scrollingBackground update:currentTime];
}


@end
