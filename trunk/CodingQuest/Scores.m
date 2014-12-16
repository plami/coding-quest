#import "Scores.h"

@interface Scores ()


@end

@implementation Scores
BOOL isInited;

+(id)sharedScore{
    static Scores* score = nil;
    if(score == nil){
        score = [[super alloc] init];
    }
    return score;
}

-(id)copy{
    return [Scores sharedScore];
}

-(id)mutableCopy{
    return [Scores sharedScore];
}


- (instancetype)initWithScore:(NSInteger)score andScene: (SKScene*) scene;
{
    self = [super init];
    if(isInited){
        return [Scores sharedScore];
    }
    
    if (self) {
        self.score = score;
        isInited = YES;
        [scene addChild:[self createScoreNode]];
    }
    return self;
}

+(instancetype)alloc{
    return [Scores sharedScore];
}

-(SKLabelNode*)createScoreNode{
    
    SKLabelNode* scoreLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"Score: %ld",(long)self.score]];
    scoreLabel.fontSize = 20;
    scoreLabel.position = CGPointMake(50 ,300);
    scoreLabel.fontName = @"Chalkduster";
    
    return scoreLabel;
}


-(void)updateScore:(SKScene *)scene newScore:(int)playerScore hiScore:(int)highScore{
    self.score +=playerScore;
}

@end
