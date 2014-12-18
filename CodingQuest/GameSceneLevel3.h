#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameSceneLevel3: SKScene <SKPhysicsContactDelegate,AVAudioPlayerDelegate>
@property NSInteger score;
@property CGFloat playerHealth;
- (void)playBackgroundMusic:(NSString *)filename;
- (void) scoreUpdated;
- (void)setupDisplay;
@end
