#import "YouWonPage.h"
#import "GameSceneLevel2.h"

@implementation YouWonPage

#pragma mark Init Method

-(instancetype) initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.7];
        
        NSString * message;
        message = @"You Won";
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        label.text = message;
        label.fontSize = 60;
        label.fontColor = [SKColor blackColor];
        label.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
        [self addChild:label];
        
        
        NSString * retrymessage;
        retrymessage = @"Continue to Level 2";
        SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        retryButton.text = retrymessage;
        retryButton.fontColor = [SKColor blackColor];
        retryButton.position = CGPointMake(self.size.width/2, 70);
        retryButton.name = @"continue";
        [retryButton setScale:.6];
        
        [self addChild:retryButton];
        
    }
    return self;
}


#pragma mark Setting the Display of Game Over Scene

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch= [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"continue"]){
        
        SKTransition* reveal = [SKTransition flipHorizontalWithDuration:0.5];
        GameSceneLevel2* scene = [GameSceneLevel2 sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeFill;
        
        [self.view presentScene:scene transition:reveal];
        
    }
}


@end
