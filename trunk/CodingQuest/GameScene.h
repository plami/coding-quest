#import <SpriteKit/SpriteKit.h>
#import "SpriteTextures.h"
#import "Scores.h"
#import <AVFoundation/AVFoundation.h>


@interface GameScene : SKScene<SKPhysicsContactDelegate,AVAudioPlayerDelegate>


@property (readonly)SpriteTextures* spriteTextures;
@property NSUInteger score;
-(void)playBackgroundMusic:(NSString *)filename;
@end
