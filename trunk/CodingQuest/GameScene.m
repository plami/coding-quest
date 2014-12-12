#import "GameScene.h"
#import "Player.h"
#import "Background.h"
#import "Monster.h"
#import "Bonus.h"


@interface GameScene ()


@property Player* player;
@property Monster* monster;
@property Bonus* coin;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@end

@implementation GameScene



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
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 2) {
        self.lastSpawnTimeInterval = 0;
        _monster = [Monster initNewMonster:self startingPoint:CGPointMake(self.frame.size.width - 100,self.frame.size.height / 2)];
        
        _coin = [Bonus initNewBonus:self startingPoint:CGPointMake(self.frame.size.width - 100,self.frame.size.height)];
        
        [_monster spawnInScene:self];
        [_coin addedInScene:self];
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
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}


@end