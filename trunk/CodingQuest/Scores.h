#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Scores : NSObject

+(id)sharedScore;



-(instancetype)initWithScore: (NSInteger) score ;

-(SKLabelNode*) createScoreNode;

-(void) updateScore: (SKScene*) scene newScore: (int) playerScore hiScore: (int) highScore;

@property NSInteger score ;
@end
