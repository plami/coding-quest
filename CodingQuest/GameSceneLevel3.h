#import <SpriteKit/SpriteKit.h>

@interface GameSceneLevel3: SKScene <SKPhysicsContactDelegate>
@property NSInteger score;

- (void)playBackgroundMusic:(NSString *)filename;

@end
