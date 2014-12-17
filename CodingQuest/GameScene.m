#import "GameScene.h"
#import "Player.h"
#import "Background.h"
#import "Monster.h"
#import "Bonus.h"
#import "Bullet.h"
#import "Constants.h"
#import "GameOverScene.h"
#import "Constants.h"
#import "FlyMonster.h"
#import "YouWonPage.h"
#import "TransitionScene.h"

@interface GameScene ()

@property Player* player;
@property Monster* monster;
@property FlyMonster* flyMonster;
@property Bonus* coin;
@property Bonus* life;
@property Bullet* bullet;
@property SKTextureAtlas* runAtlas;
@property (readwrite)SpriteTextures* spriteTextures;
@property Background* scrollingBackground;
@property Player* lives;

@property NSInteger counter;
@property NSMutableArray* monsterArray;
@property NSTimeInterval runningTime;
@property CGFloat playerHealth;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property NSTimeInterval lastHorizontalCoinSpawnInterval;
@property NSTimeInterval lastVerticalCoinSpawnInterval;
@property SKAction* getBonusSound;
@property SKAction* playerBeingHitSound;
@property SKAction* playerShootSound;
@property AVAudioPlayer* backgroundMusicPlayer;
@end

@implementation GameScene


#pragma mark Init Method

-(instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
         if(self){
            self.monsterArray = [[NSMutableArray alloc]init];
            self.backgroundColor = [SKColor whiteColor];
             
           //  self.score = [[Scores alloc]initWithScore:0];
             
            //[self addChild: [self.score createScoreNode]];
             NSString* imageName = [NSString stringWithFormat:@"gameBackground.png"];
             Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:1 andMusic:@"backgroundSound1.wav"];
             [self playBackgroundMusic:@"backgroundSound1.wav"];
             
             self.scrollingBackground = scrollingBackground;
             [self addChild: self.scrollingBackground];
             [self.scrollingBackground setScale:1.7];
             
             
             //the scene is set as delegate in physicsWorld
             self.physicsWorld.contactDelegate = self;
             
             //sets the gravity of the game world to zero
             self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
             
             self.counter = 0;
             
             _player  = [Player initNewPlayer:self startingPoint:CGPointMake(20, 60) ];
            
             _playerHealth = 1.0f;
             
             [_player runOnPlaceRight];
             [self addChild:[self fireButton]];

             [self setupDisplay];
         }

    return self;
}


#pragma mark Setting up the Display of the main scene

-(void)setupDisplay {
    
    SKLabelNode* scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    
    scoreLabel.name = kScoreName;
    scoreLabel.fontSize = 15;
    
    scoreLabel.fontColor = [SKColor greenColor];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %04u", 0];
    
    scoreLabel.position = CGPointMake(20 + scoreLabel.frame.size.width/2, self.size.height - (20 + scoreLabel.frame.size.height/2));
    [self addChild:scoreLabel];
    
    SKLabelNode* healthLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    
    healthLabel.name = kHealthName;
    healthLabel.fontSize = 15;
    
    healthLabel.fontColor = [SKColor redColor];
    healthLabel.text = [NSString stringWithFormat:@"Health: %.1f%%", self.playerHealth * 100.0f];
    
    healthLabel.position = CGPointMake(self.size.width - healthLabel.frame.size.width/2 - 20, self.size.height - (20 + healthLabel.frame.size.height/2));
    [self addChild:healthLabel];
    
    SKLabelNode* livesLabel = [SKLabelNode labelNodeWithFontNamed:@"Lives"];
    
    livesLabel.name = kLivesName;
    livesLabel.fontSize = 15;
    
    livesLabel.fontColor = [SKColor greenColor];
    livesLabel.text = [NSString stringWithFormat:@"Lives: %ld", (long)[_player livesRemaining]];
    
    livesLabel.position = CGPointMake(self.size.width - livesLabel.frame.size.width/2 - 200, self.size.height - (19 + livesLabel.frame.size.height/2));
    [self addChild:livesLabel];
}


-(void)adjustPlayerHealth:(CGFloat)healthAdjustment {

    self.playerHealth = MAX(self.playerHealth + healthAdjustment, 0);
    
    SKLabelNode* health = (SKLabelNode*)[self childNodeWithName:kHealthName];
    health.text = [NSString stringWithFormat:@"Health: %.1f%%", self.playerHealth * 100];
}


-(void)adjustScoreBy:(NSUInteger)points {
    self.score += points;
    SKLabelNode* score = (SKLabelNode*)[self childNodeWithName:kScoreName];
    score.text = [NSString stringWithFormat:@"Score: %04u", self.score];
}


-(SKSpriteNode* ) fireButton{
    
    SKSpriteNode* fire = [SKSpriteNode spriteNodeWithImageNamed:@"button.png"];
    fire.position = CGPointMake(self.frame.size.width- 100, 20);
    
    fire.name = @"fireButton";
    fire.zPosition = 1.0;
    fire.size = CGSizeMake(50, 50);
    return fire;
    
    return fire;
}


#pragma mark Setup Collisions

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
    
    //react to the contact between coin and player
    if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & coinCategory) != 0) {
        NSLog(@"the coin disappears");
        [secondBody.node removeFromParent];
        [self adjustScoreBy:5];
        _getBonusSound = [SKAction playSoundFileNamed:@"coin.mp3" waitForCompletion:NO];
        [self runAction:self.getBonusSound];
    }
    
    //react to the contact between bullet and monster
    else if (((firstBody.node.physicsBody.categoryBitMask & bulletCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & monsterCategory) != 0) {
        NSLog(@"the monster disappears");
        
        self.counter++;
        [self adjustScoreBy:1];
        [[self.monsterArray firstObject] die];
        
        if([self.monsterArray count] > 0){
            [self.monsterArray removeObjectAtIndex:0];
            [firstBody.node removeFromParent];
        }
        [secondBody.node removeFromParent];
    }
    
    //react to the contact between monster and player
    else if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & monsterCategory) != 0) {
        [secondBody.node removeFromParent];
        [_player playerWasHit];
         NSLog(@"the lives are reduced");
        
    }
    
    //react to the contact between player and monsterBullet
    else if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & monsterBulletCategory) != 0) {
        _playerBeingHitSound = [SKAction playSoundFileNamed:@"playerBeingHit.mp3" waitForCompletion:NO];
        [self runAction:self.playerBeingHitSound];
        
        [self adjustPlayerHealth:-0.10f];
        [secondBody.node removeFromParent];
        if(self.playerHealth <= 0.0f){
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            GameOverScene* gameOverScene = [[GameOverScene alloc] initWithSize:self.size];
            gameOverScene.finalScore = self.score;

            [self.view presentScene:gameOverScene transition: reveal];
        }
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    

    for(UITouch* touch in touches){
    
        PlayerStatus status = _player.playerStatus;

        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"fireButton"]){
            
            _playerShootSound = [SKAction playSoundFileNamed:@"shoot.mp3" waitForCompletion:NO];
            [self runAction:self.playerShootSound];
            
            if (status == PlayerFacingRight || status == PlayerRunningRight || status == PlayerSkiddingRight){
                _bullet = [Bullet initNewBullet3:self startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
                
                [_bullet shootRight];
            }
            if (status == PlayerFacingLeft || status == PlayerRunningLeft || status == PlayerSkiddingLeft ){
                _bullet = [Bullet initNewBulletLeft3:self startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
                [_bullet shootLeft];
            }
        }
        
        else {
            
            if (location.y >= (self.frame.size.height / 2 )) {
                // user touched upper half of the screen (zero = bottom of screen)
                if (status != PlayerJumpingLeft && status != PlayerJumpingRight && status != PlayerJumpingUpFacingLeft && status != PlayerJumpingUpFacingRight) {
                    [_player jump];
                }
            } else if (location.x <= ( self.frame.size.width / 2 )) {
                // user touched left side of screen
                if (status == PlayerRunningRight) {
                    [_player skidRight];
                    [_player runOnPlaceRight];
                } else if (status == PlayerFacingLeft || status == PlayerFacingRight) {
                    [_player runLeft];
                }
            } else {
                // user touched right side of screen
                if (status == PlayerRunningLeft) {
                    [_player skidLeft];
                    [_player runOnPlaceLeft];
                } else if (status == PlayerFacingLeft || status == PlayerFacingRight) {
                    [_player runRight];
                }
            }

        }
    }
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    self.lastSpawnTimeInterval += timeSinceLast;
    self.lastHorizontalCoinSpawnInterval +=timeSinceLast;
    self.runningTime +=timeSinceLast;
    self.lastVerticalCoinSpawnInterval +=timeSinceLast;
    
    if(self.lastHorizontalCoinSpawnInterval > 3){
        self.lastHorizontalCoinSpawnInterval = 0;
        _coin = [Bonus initNewBonus:self startingPoint:CGPointMake(self.frame.size.width - 10 ,[_player randomPlace:self])];
        [_coin moveLeft];
    }
    if(self.lastVerticalCoinSpawnInterval > 2){
        
        self.lastVerticalCoinSpawnInterval = 0;
        _life = [Bonus initNewBonus:self startingPoint:CGPointMake([_player randomPlace:self], self.frame.size.height)];
        [_life spawnInSceneVerticaly];

    }
    if (self.lastSpawnTimeInterval > 5) {

        self.lastSpawnTimeInterval = 0;
        
        if(self.runningTime > 10){
            [_backgroundMusicPlayer stop];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            TransitionScene* transition = [[TransitionScene alloc] initWithSize:self.size];
            [self.view presentScene:transition transition:reveal];
        }

       _monster = [[Monster alloc]initNewMonster:self];
       [_monster spawnInScene:self];
       [_monster shoot:self];
        [self.monsterArray addObject:_monster];
        
        //shooting all monsters
        for(int index  = 0 ; index < self.monsterArray.count; index++){
            [self.monsterArray[index] shoot:self];
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

- (void)playBackgroundMusic:(NSString *)filename
{
    NSError *error;
    NSURL *backgroundMusicURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    _backgroundMusicPlayer.numberOfLoops = -1;
    _backgroundMusicPlayer.volume = 0.8;
    _backgroundMusicPlayer.delegate = self;
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
}

@end
