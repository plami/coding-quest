#import "StartingPage.h"
#import "GameScene.h"

@implementation StartingPage

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        /* Setup your scene here */
        
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bgImage];
        
        //button for Level 1
        NSString *LevelOneButton;
        LevelOneButton = @"Level 1";
        
        SKLabelNode *myLabelLevelOne = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelOne.text = LevelOneButton;
        myLabelLevelOne.fontSize = 40;
        myLabelLevelOne.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelOne.position = CGPointMake(130, 260);
        myLabelLevelOne.name = @"Level 1 button";
        
        [self addChild:myLabelLevelOne];
        
        //button for Level 2
        NSString *LevelTwoButton;
        LevelTwoButton = @"Level 2";
        
        SKLabelNode *myLabelLevelTwo = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelTwo.text = LevelTwoButton;
        myLabelLevelTwo.fontSize = 40;
        myLabelLevelTwo.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelTwo.position = CGPointMake(130, 200);
        myLabelLevelTwo.name = @"Level 2 button";
        
        [self addChild:myLabelLevelTwo];
        
        //button for Level 3
        NSString *LevelThreeButton;
        LevelThreeButton = @"Level 3";
        
        SKLabelNode *myLabelLevelThree = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelThree.text = LevelThreeButton;
        myLabelLevelThree.fontSize = 40;
        myLabelLevelThree.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelThree.position = CGPointMake(130, 140);
        myLabelLevelThree.name = @"Level 2 button";
        
        [self addChild:myLabelLevelThree];
        
        //button for HighScore
        NSString *HighScoreButton;
        HighScoreButton = @"HIGH SCORE";
        
        SKLabelNode *myLabelHighScore = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelHighScore.text = HighScoreButton;
        myLabelHighScore.fontSize = 40;
        myLabelHighScore.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelHighScore.position = CGPointMake(130, 60);
        myLabelHighScore.name = @"High Score button";
        
        [self addChild:myLabelHighScore];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"Level 1 button"]) {
        
        SKTransition *reveal = [SKTransition fadeWithDuration:2];
        
        GameScene *scene = [GameScene sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:scene transition:reveal];
    }
}
@end
