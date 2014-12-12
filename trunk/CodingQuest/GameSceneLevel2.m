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
        Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:1];
        
        self.scrollingBackground = scrollingBackground;
        [self addChild: self.scrollingBackground];
        [self.scrollingBackground setScale:1.7];
        _player = [Player initNewPlayer1:self startingPoint:CGPointMake(20,40)];
        [_player runOnPlace];
        
    }
    return self;
}


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for(UITouch* touch in touches){
        
        PlayerStatus status = _player.playerStatus;
        CGPoint location = [touch locationInNode:self];
        
        
        if(location.y >= (self.frame.size.height / 2)){
            
            if(status != PlayerJumpingLeft && status != PlayerJumpingRight && status != PlayerJumpingUpFacingLeft && status != PlayerJumpingUpFacingRight){
                [_player jump];
            }
        }
        else if(location.x <= (self.frame.size.width / 2)){
            if(status == PlayerRunningRight){
                [_player skidRight];
            }
            else if(status == PlayerFacingLeft || status == PlayerFacingRight){
                [_player runLeft];
            }
        }
        else{
            if(status == PlayerRunningLeft){
                [_player skidLeft];
            }
            else if( status == PlayerFacingLeft || PlayerFacingRight){
                [_player runRight];
            }
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
