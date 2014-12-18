#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface StartingPage : SKScene<AVAudioPlayerDelegate>

- (void)playBackgroundMusic:(NSString *)filename;
@end
