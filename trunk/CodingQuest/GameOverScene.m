#import "GameOverScene.h"
#import "GameScene.h"
#import "StartingPage.h"

@interface GameOverScene ()

@property NSString* endScore;
@property SKLabelNode* scoreLabel;

@property SKAction* gameOverSound;

@end

@implementation GameOverScene

#pragma mark Init Method


-(instancetype) initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        _gameOverSound = [SKAction playSoundFileNamed:@"gameOver.wav" waitForCompletion:NO];
        [self runAction:self.gameOverSound];

        //adding background
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bgImage];
        
        //adding logos
        SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"itTalents.png"];
        logo.position = CGPointMake(830, 580);
        [self addChild:logo];
        
        GameScene* thisScene = [[GameScene alloc]init];
        self.finalScore = thisScene.score;
        
        NSString * message;
        message = @"Game Over";

        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        label.text = message;
        label.fontSize = 60;
        label.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        label.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
        [self addChild:label];
        
        
        NSString * retrymessage;
        retrymessage = @"Replay Game";
        SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        retryButton.text = retrymessage;
        retryButton.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        retryButton.position = CGPointMake(self.size.width/2, 70);
        retryButton.name = @"retry";
        [retryButton setScale:.6];
        
        [self addChild:retryButton];
        
        NSString* menuMessage;
        menuMessage = @"Back to menu";
        SKLabelNode* backButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        backButton.text = menuMessage;
        backButton.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        backButton.position = CGPointMake(self.size.width / 2, 120);
        backButton.name = @"back";
        [backButton setScale:.6];
        
        [self addChild:backButton]; 
        
    }
    return self;
}

-(void) updated{
    NSLog(@"finnal score: %ld ",(long)self.finalScore);
    //self.endScore = [NSString stringWithFormat:@"Final score: %ld",(long)self.finalScore];
    self.endScore = [NSString stringWithFormat:@"Final score: %ld", (long)self.finalScore];
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
    NSLog(@"%ld",(long) self.finalScore);
    self.scoreLabel.text = self.endScore;
    self.scoreLabel.position = CGPointMake(70, 300);
    [self.scoreLabel setScale: .6];
    
    [self addChild:self.scoreLabel];
}

#pragma mark Setting the Display of Game Over Scene

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch= [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* node = [self nodeAtPoint:location];
   
    if([node.name isEqualToString:@"retry"]){
    
        SKTransition* reveal = [SKTransition flipHorizontalWithDuration:0.5];
        GameScene* scene = [GameScene sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeFill;
        
        [self.view presentScene:scene transition:reveal];
        
    }
    else if([node.name isEqualToString:@"back"]){
        
        SKTransition* flip = [SKTransition doorsOpenVerticalWithDuration:0.5];
        StartingPage* page = [StartingPage sceneWithSize:CGSizeMake(self.size.width * 2, self.size.height * 2)];
        page.scaleMode = SKSceneScaleModeFill;
        
        [self.view presentScene:page transition:flip ];
        
    }
}

@end
