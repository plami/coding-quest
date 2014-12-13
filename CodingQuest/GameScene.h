#import <SpriteKit/SpriteKit.h>
#import "SpriteTextures.h"

@interface GameScene : SKScene<SKPhysicsContactDelegate>

@property (readonly)SpriteTextures* spriteTextures;

@end
