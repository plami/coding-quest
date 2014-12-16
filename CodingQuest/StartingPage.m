#import "StartingPage.h"
#import "GameScene.h"
#import "GameSceneLevel2.h"
#import "GameSceneLevel3.h"

@implementation StartingPage


#pragma mark Init Method

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        /* Setup your scene here */
        
        //adding background
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bgImage];
        
        //adding logos
        SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"itTalents.png"];
        logo.position = CGPointMake(830, 580);
        [self addChild:logo];
        
        //button for Level 1
        NSString *LevelOneButton;
        LevelOneButton = @"Level 1";
        
        SKLabelNode *myLabelLevelOne = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelOne.text = LevelOneButton;
        myLabelLevelOne.fontSize = 80;
        myLabelLevelOne.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelOne.position = CGPointMake(200, 500);
        myLabelLevelOne.name = @"Level 1 button";
        
        [self addChild:myLabelLevelOne];
        
        //button for Level 2
        NSString *LevelTwoButton;
        LevelTwoButton = @"Level 2";
        
        SKLabelNode *myLabelLevelTwo = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelTwo.text = LevelTwoButton;
        myLabelLevelTwo.fontSize = 80;
        myLabelLevelTwo.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelTwo.position = CGPointMake(200, 350);
        myLabelLevelTwo.name = @"Level 2 button";
        
        [self addChild:myLabelLevelTwo];
        
        //button for Level 3
        NSString *LevelThreeButton;
        LevelThreeButton = @"Level 3";
        
        SKLabelNode *myLabelLevelThree = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelLevelThree.text = LevelThreeButton;
        myLabelLevelThree.fontSize = 80;
        myLabelLevelThree.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelLevelThree.position = CGPointMake(200, 200);
        myLabelLevelThree.name = @"Level 3 button";
        
        [self addChild:myLabelLevelThree];
        
        //button for HighScore
        NSString *HighScoreButton;
        HighScoreButton = @"HIGH SCORE";
        
        SKLabelNode *myLabelHighScore = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myLabelHighScore.text = HighScoreButton;
        myLabelHighScore.fontSize = 70;
        myLabelHighScore.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myLabelHighScore.position = CGPointMake(700, 70);
        myLabelHighScore.name = @"High Score button";
        
        [self addChild:myLabelHighScore];
    }
    return self;
}


#pragma mark Display for transition between the levels

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
    
    if ([node.name isEqualToString:@"Level 2 button"]) {
        
        SKTransition *reveal = [SKTransition fadeWithDuration:2];
        
        GameSceneLevel2 *scene = [GameSceneLevel2 sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:scene transition:reveal];
    }
    if ([node.name isEqualToString:@"Level 3 button"]) {
        
        SKTransition *reveal = [SKTransition fadeWithDuration:2];
        
        GameSceneLevel3 *scene = [GameSceneLevel3 sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:scene transition:reveal];
    }
}


@end
