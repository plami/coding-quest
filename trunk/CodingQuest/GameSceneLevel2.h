#import <SpriteKit/SpriteKit.h>

@interface GameSceneLevel2 : SKScene<SKPhysicsContactDelegate>

@property (readonly)NSUInteger score;
- (void)playBackgroundMusic:(NSString *)filename;

@end
