#import "GameScene.h"
#import "Player.h"
#import "Background.h"
#import "Monster.h"
#import "Bonus.h"
#import "Bullet.h"
#import "Constants.h"
#import "GameOverScene.h"

@interface GameScene ()


@property Player* player;
@property Monster* monster;
@property Bonus* coin;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;

@property Bullet* bullet;

@property NSTimeInterval runningTime;


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
             
             //the scene is set as delegate in physicsWorld
             self.physicsWorld.contactDelegate = self;
             
             //sets the gravity of the game world to zero
             self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
             
             _player  = [Player initNewPlayer:self startingPoint:CGPointMake(20, 60) ];
             
             _player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_player.frame.size];
             _player.physicsBody.restitution = 0.1f;
             _player.physicsBody.friction = 0.4f;
             
             // make physicsBody static
             _player.physicsBody.dynamic = YES;
             _player.name = @"player";
             
             _player.physicsBody.categoryBitMask = playerCategory;
             _player.physicsBody.contactTestBitMask = coinCategory;
             _player.physicsBody.collisionBitMask = 0;
             
             NSString *ShootButton;
             ShootButton = @"Shoot";
             
             SKLabelNode *myShootLabel = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
             
             myShootLabel.text = ShootButton;
             myShootLabel.fontSize = 20;
             myShootLabel.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
             myShootLabel.position = CGPointMake(self.frame.size.width- 100, 20);
             myShootLabel.name = @"shoot";
             
             [self addChild:myShootLabel];
             
             [_player runOnPlaceRight];
        }

    return self;
    
}


-(void)didBeginContact:(SKPhysicsContact*)contact {
    
    // 1 Create local variables for two physics bodies
    SKPhysicsBody* firstBody;
    SKPhysicsBody* secondBody;
    
    // 2 Assign the two physics bodies so that the one with the lower category is always stored in firstBody
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    //    NSLog(@"firstBodyCategory %@, secondBodyCategory %@",firstBody.node.name, secondBody.node.name);
    
    
    // 3 react to the contact between coin and player
    if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & coinCategory) != 0) {
        NSLog(@"coina iz4ezva");
        [secondBody.node removeFromParent];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for(UITouch* touch in touches){
    
    
        PlayerStatus status = _player.playerStatus;
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];

        
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
        
        if(location.y >= (self.frame.size.height / 2)){
            
            if(status != PlayerJumpingLeft && status != PlayerJumpingRight && status != PlayerJumpingUpFacingLeft && status != PlayerJumpingUpFacingRight){
                [_player jump];
            }
        }
        else if(location.x <= (self.frame.size.width / 2)){
            if(status == PlayerRunningRight){
                [_player skidRight];
                [_player runOnPlaceRight];
            }
            else if(status == PlayerFacingLeft || status == PlayerFacingRight){
                [_player runLeft];
            }
        }
        else{
            if(status == PlayerRunningLeft){
                [_player skidLeft];
                [_player runOnPlaceLeft];
            }
            else if( status == PlayerFacingLeft || PlayerFacingRight){
                [_player runRight];
            }
        }
        }
    }
    
}
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    self.runningTime +=timeSinceLast;
    if (self.lastSpawnTimeInterval > 2.5) {
        self.lastSpawnTimeInterval = 0;
        _monster = [[Monster alloc]initNewMonster:self startingPoint:CGPointMake(self.frame.size.width - 100, self.frame.size.height / 2)];
        
        _coin = [Bonus initNewBonus:self startingPoint:CGPointMake(self.frame.size.width - 10 ,self.frame.size.height/2)];
        
        _coin.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_coin.frame.size.width/2];
        
        [_coin moveLeft];
        
        [_monster spawnInScene:self];
        
        if(self.runningTime > 10){
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * gameOverScene = [[GameOverScene alloc] initWithSize:self.size];
            [self.view presentScene:gameOverScene transition: reveal];
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
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
    

}


@end
