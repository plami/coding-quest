#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Scores : NSObject

-(void) createScoreNode: (SKScene*) scene;

-(void) updateScore: (SKScene*) scene newScore: (int) playerScore hiScore: (int) highScore;


@end
