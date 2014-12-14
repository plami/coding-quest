#import "GameOverScene.h"
#import "GameScene.h"
#import "StartingPage.h"

@implementation GameOverScene


-(instancetype) initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.3 green:0.9 blue:1.0 alpha:1.0];
        
        //adding logos
        SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"itTalents.png"];
        logo.position = CGPointMake(830, 580);
        [self addChild:logo];
        
        // 2
        NSString * message;
        message = @"Game Over";
        // 3
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        label.text = message;
        label.fontSize = 40;
        label.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        label.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:label];
        
        
        NSString * retrymessage;
        retrymessage = @"Replay Game";
        SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        retryButton.text = retrymessage;
        retryButton.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        retryButton.position = CGPointMake(self.size.width/2, 50);
        retryButton.name = @"retry";
        [retryButton setScale:.6];
        
        [self addChild:retryButton];
        
        NSString* menuMessage;
        menuMessage = @"Back to menu";
        SKLabelNode* backButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        backButton.text = menuMessage;
        backButton.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        backButton.position = CGPointMake(self.size.width / 2, 100);
        backButton.name = @"back";
        [backButton setScale:.6];
        
        [self addChild:backButton];
    }
    return self;
}


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
        
        SKTransition* flip = [SKTransition flipHorizontalWithDuration:0.5];
        StartingPage* page = [StartingPage sceneWithSize:CGSizeMake(self.size.width * 2, self.size.height * 2)];
        
        page.scaleMode = SKSceneScaleModeFill;
        
        [self.view presentScene:page transition:flip ];
        
    }
}

@end
