#import "TransitionScene.h"
#import "GameSceneLevel2.h"

@implementation TransitionScene

#pragma mark Init Method

-(instancetype) initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        
        //adding background
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bgImage];
        
        //adding logos
        SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"itTalents.png"];
        logo.position = CGPointMake(830, 580);
        [self addChild:logo];
        
        NSString * message;
        message = @"Coding Quest 1 completed";
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        label.text = message;
        label.fontSize = 40;
        label.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        label.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
        [self addChild:label];
        
        
        NSString * nextLevel;
        nextLevel = @"Continue to the next level";
        SKLabelNode *nextLevelButton = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        nextLevelButton.text = nextLevel;
        nextLevelButton.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        nextLevelButton.position = CGPointMake(self.size.width/2, 120);
        nextLevelButton.name = @"continue to Level 2";
        [nextLevelButton setScale:.8];
        
        [self addChild:nextLevelButton];
        
        
    }
    return self;
}


#pragma mark Setting the Display of Game Over Scene

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch= [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"continue to Level 2"]){
        
        SKTransition* reveal = [SKTransition flipHorizontalWithDuration:0.5];
        GameSceneLevel2* scene = [GameSceneLevel2 sceneWithSize:self.view.bounds.size];
        scene.scaleMode = SKSceneScaleModeFill;
        
        [self.view presentScene:scene transition:reveal];
        
    }
}

@end
