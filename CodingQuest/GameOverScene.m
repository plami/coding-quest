#import "GameOverScene.h"
#import "GameScene.h"
#import "StartingPage.h"

@implementation GameOverScene


#pragma mark Init Method

-(instancetype) initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.7];
        
        NSString * message;
        message = @"Game Over";

        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        label.text = message;
        label.fontSize = 60;
        label.fontColor = [SKColor blackColor];
        label.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
        [self addChild:label];
        
        
        NSString * retrymessage;
        retrymessage = @"Replay Game";
        SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        retryButton.text = retrymessage;
        retryButton.fontColor = [SKColor blackColor];
        retryButton.position = CGPointMake(self.size.width/2, 70);
        retryButton.name = @"retry";
        [retryButton setScale:.6];
        
        [self addChild:retryButton];
        
        NSString* menuMessage;
        menuMessage = @"Back to menu";
        SKLabelNode* backButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        backButton.text = menuMessage;
        backButton.fontColor = [SKColor blackColor];
        backButton.position = CGPointMake(self.size.width / 2, 120);
        backButton.name = @"back";
        [backButton setScale:.6];
        
        [self addChild:backButton];
    }
    return self;
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
