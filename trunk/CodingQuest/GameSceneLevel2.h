#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameSceneLevel2 : SKScene<SKPhysicsContactDelegate,AVAudioPlayerDelegate>

@property NSUInteger score;
- (void)playBackgroundMusic:(NSString *)filename;
- (void) updated;
@end
