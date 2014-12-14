#import <SpriteKit/SpriteKit.h>
#import "SpriteTextures.h"
#import "Scores.h"
@interface GameScene : SKScene<SKPhysicsContactDelegate>

@property (readonly)SpriteTextures* spriteTextures;

@end
