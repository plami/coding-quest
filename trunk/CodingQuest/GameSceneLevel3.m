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
#import "Button.h"

@interface GameSceneLevel3 ()

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
@property Button* thisButton;


@property NSInteger counter;
@property NSMutableArray* monsterArray;
@property NSTimeInterval runningTime;

@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property SKAction* getBonusSound;
@property SKAction* playerBeingHitSound;
@property SKAction* playerShootSound;
@property SKAction* monsterDieSound;
@property AVAudioPlayer* backgroundMusicPlayer;
@end

@implementation GameSceneLevel3


#pragma mark Init Method

-(instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    if(self){
        self.monsterArray = [[NSMutableArray alloc]init];
        self.backgroundColor = [SKColor whiteColor];
        [self playBackgroundMusic:@"backgroundSound3.mp3"];
        NSString* imageName = [NSString stringWithFormat:@"spaceshipBackgroundLevel3.png"];
        Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:1];
        
        self.scrollingBackground = scrollingBackground;
        [self addChild: self.scrollingBackground];
        [self.scrollingBackground setScale:1.7];
        
        self.thisButton = [[Button alloc]initWithScene:self];
        
        //the scene is set as delegate in physicsWorld
        self.physicsWorld.contactDelegate = self;
        
        //sets the gravity of the game world to zero
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        
        self.counter = 0;
        
        _player  = [Player initNewPlayer:self startingPoint:CGPointMake(kPlayerStartX, kPlayerStartY) ];
        
        [_player runOnPlaceRight];

    }
    
    return self;
}


#pragma mark Setting up the Display of the main scene

-(void)scoreUpdated{

    SKLabelNode* scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    
    scoreLabel.name = kScoreName;
    scoreLabel.fontSize = 15;
    
    scoreLabel.fontColor = [SKColor greenColor];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %04lu", (unsigned long)                       self.score];
    
    scoreLabel.position = CGPointMake(20 + scoreLabel.frame.size.width/2, self.size.height - (20 + scoreLabel.frame.size.height/2));
    [self addChild:scoreLabel];

}

-(void)setupDisplay {
    
    SKLabelNode* healthLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    
    healthLabel.name = kHealthName;
    healthLabel.fontSize = 15;
    
    healthLabel.fontColor = [SKColor redColor];
    healthLabel.text = [NSString stringWithFormat:@"Health: %.1f%%", self.playerHealth * 100.0f];
    
    healthLabel.position = CGPointMake(self.size.width - healthLabel.frame.size.width/2 - 20, self.size.height - (20 + healthLabel.frame.size.height/2));
    [self addChild:healthLabel];
    
}


-(void)adjustPlayerHealth:(CGFloat)healthAdjustment {
    
    self.playerHealth = MAX(self.playerHealth + healthAdjustment, 0);
    
    SKLabelNode* health = (SKLabelNode*)[self childNodeWithName:kHealthName];
    health.text = [NSString stringWithFormat:@"Health: %.1f%%", self.playerHealth * 100];
}


-(void)adjustScoreBy:(NSUInteger)points {
    self.score += points;
    SKLabelNode* score = (SKLabelNode*)[self childNodeWithName:kScoreName];
    score.text = [NSString stringWithFormat:@"Score: %04lu", (unsigned long)self.score];
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
        _monsterDieSound = [SKAction playSoundFileNamed:@"monsterDeath.mp3" waitForCompletion:NO];
        [self runAction:self.monsterDieSound];
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
        [self.backgroundMusicPlayer stop];

        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        GameOverScene* gameOverScene = [[GameOverScene alloc] initWithSize:self.size];
        gameOverScene.finalScore = self.score;
        [self.view presentScene:gameOverScene transition: reveal];

        [secondBody.node removeFromParent];

    }
    

    //react to the contact between player and monsterBullet
    else if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & monsterBulletCategory) != 0) {
        _playerBeingHitSound = [SKAction playSoundFileNamed:@"playerBeingHit.mp3" waitForCompletion:NO];
        [self runAction:self.playerBeingHitSound];
        [self adjustPlayerHealth:-0.10f];
        [secondBody.node removeFromParent];
        if(self.playerHealth <= 0.0f){
            [self.backgroundMusicPlayer stop];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            GameOverScene* gameOverScene = [[GameOverScene alloc] initWithSize:self.size];
            gameOverScene.finalScore = self.score;
            [gameOverScene updated];
            [self.view presentScene:gameOverScene transition: reveal];
        }
    }
    //react to the contact between player and flyingMonsteBullet
    else if (((firstBody.node.physicsBody.categoryBitMask & playerCategory) != 0) && (secondBody.node.physicsBody.categoryBitMask & flyingMonsterBulletCategory) != 0) {
        _playerBeingHitSound = [SKAction playSoundFileNamed:@"playerBeingHit.mp3" waitForCompletion:NO];
        [self runAction:self.playerBeingHitSound];
        [self adjustPlayerHealth:-0.10f];
        [secondBody.node removeFromParent];
        if(self.playerHealth <= 0.0f){
            [self.backgroundMusicPlayer stop];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            GameOverScene* gameOverScene = [[GameOverScene alloc] initWithSize:self.size];
            gameOverScene.finalScore = self.score;
            [gameOverScene updated];
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

-(NSInteger) random{
    int minX = _player.size.height / 2;
    int maxY = self.frame.size.height - _player.size.height / 2;
    int rangeY = maxY - minX;
    int actualY = (arc4random() % rangeY) + minX;
    
    return actualY;
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    self.lastSpawnTimeInterval += timeSinceLast;
    self.runningTime +=timeSinceLast;
    
    
    if (self.lastSpawnTimeInterval > 3) {
        self.lastSpawnTimeInterval = 0;
        
        if(self.runningTime > 5){
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            YouWonPage* winning = [[YouWonPage alloc] initWithSize:self.size];
            winning.result = self.score;
            [self.view presentScene:winning transition:reveal];
        }
        
        //creating bonuses
        _coin = [Bonus initNewBonus:self startingPoint:CGPointMake(self.frame.size.width - 10 ,[_player randomPlace:self])];
        _coin.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_coin.frame.size.width/2];
        
        
        [_coin moveLeft];
        
        //creating bonuses
        _life = [Bonus initNewBonus:self startingPoint:CGPointMake([_player randomPlace:self], self.frame.size.height)];
        [_life spawnInSceneVerticaly];
        
        //creating flying bugs
        _flyMonster = [[FlyMonster alloc]initNewMonster:self];
        [_flyMonster spawnInScene:self];
        [_flyMonster shoot:self];
        
        //creating normal bugs
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
