#import "StartingPage.h"
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"
#import "Constants.h"

@interface StartingPage ()

@property AVAudioPlayer* backgroundMusicPlayer;

@end
@implementation StartingPage


#pragma mark Init Method

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        /* Setup your scene here */
        
        //adding background sound
        [self playBackgroundMusic:@"backgroundStartScreen.mp3"];
        
        //adding background
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bgImage];
        
        //adding logos
        SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"itTalents.png"];
        logo.position = CGPointMake(830, 580);
        [self addChild:logo];
        
        //button for the title
        NSString *GameTitle;
        GameTitle = @"CODING QUEST";
        
        SKLabelNode *myLabelTitle = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelTitle.text = GameTitle;
        myLabelTitle.fontSize = 120;
        myLabelTitle.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelTitle.position = CGPointMake(kGameTitleMax, kGameTitleMin);
        myLabelTitle.name = @"Level 1 button";
        myLabelTitle.zPosition = 1;
        
        [self addChild:myLabelTitle];
        
        //Play button
        NSString *PlayButton;
        PlayButton = @"Play";
        
        SKLabelNode *myLabelPlay = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelPlay.text = PlayButton;
        myLabelPlay.fontSize = 80;
        myLabelPlay.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelPlay.position = CGPointMake(kGamePlayMax, kGamePlayMin);
        myLabelPlay.name = @"Play button";
        myLabelPlay.zPosition = 1;
        
        [self addChild:myLabelPlay];

    }
    return self;
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


#pragma mark Display for transition between the levels

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"Play button"]) {
        [_backgroundMusicPlayer stop];
        SKTransition *reveal = [SKTransition fadeWithDuration:2];
        
        GameScene *scene = [GameScene sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:scene transition:reveal];
        [self removeActionForKey:@"music"];
    }
}


@end
