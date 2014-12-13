#import "GameSceneLevel3.h"
#import "Player.h"
#import "Background.h"
#import "Bullet.h"
#import "Monster.h"
#import "Bonus.h"

@interface GameSceneLevel3 ()
@property Player* player;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;
@property Bullet* bullet;
@property Monster* monster;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property Bonus* coin;
@end

@implementation GameSceneLevel3




-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if(self){
        
        //background set
        
        self.backgroundColor = [SKColor whiteColor];
        NSString* imageName = [NSString stringWithFormat:@"spaceshipBackground.jpg"];
        Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:2];
        self.scrollingBackground = scrollingBackground;
        [self addChild: self.scrollingBackground];
        [self.scrollingBackground setScale:2.1];
        
//       initiate player
        
        _player = [Player initNewPlayer:self startingPoint: CGPointMake(20, 40)];
        [_player runOnPlaceRight];
        
        //shoot button
        NSString *ShootButton;
        ShootButton = @"Shoot";
        
        SKLabelNode *myShootLabel = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myShootLabel.text = ShootButton;
        myShootLabel.fontSize = 20;
        myShootLabel.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myShootLabel.position = CGPointMake(self.frame.size.width- 100, 20);
        myShootLabel.name = @"shoot";
        
        [self addChild:myShootLabel];
    }
    
//    _monster = [Monster initNewMonster:self startingPoint:CGPointMake(self.frame.size.width-300, 40)];
//    [_monster spawnInScene:self];
    return self;
    
}
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
//    
//    self.lastSpawnTimeInterval += timeSinceLast;
//    if (self.lastSpawnTimeInterval > 2) {
//        self.lastSpawnTimeInterval = 0;
//        _monster = [Monster initNewMonster:self startingPoint:CGPointMake(self.frame.size.width - 300,self.frame.size.height/2)];
//        
////        _coin = [Bonus initNewBonus:self startingPoint:CGPointMake(self.frame.size.width - 100,self.frame.size.height)];
//        
//        [_monster spawnInScene:self];
//    }
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
    
    
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    PlayerStatus status = _player.playerStatus;
    
    if ([node.name isEqualToString:@"shoot"]) {
        if (status == PlayerFacingRight || status == PlayerRunningRight || status == PlayerSkiddingRight){
            _bullet = [Bullet initNewBullet3:self startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
            
            [_bullet shootRight];
        }
        if (status == PlayerFacingLeft || status == PlayerRunningLeft || status == PlayerSkiddingLeft ){
            _bullet = [Bullet initNewBulletLeft3:self startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
            [_bullet shootLeft];
        }
    }
    
    
    else{
    
    if(location.y >= (self.frame.size.height / 2) ){
        

        if(status != PlayerJumpingLeft && status != PlayerJumpingRight && status != PlayerJumpingUpFacingLeft && status != PlayerJumpingUpFacingRight){
            [_player jump];
        }

    }
    else if(location.x <= (self.frame.size.width / 2)){
        if(status == PlayerRunningRight){
            [_player skidRight];
        }
        else if((status == PlayerFacingLeft || status == PlayerFacingRight)){
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


-(void)didMoveToView:(SKView *)view{
}
-(void)didBeginContact:(SKPhysicsContact *)contact{
    
}
@end
