#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
@interface GameOverScene : SKScene

@property NSInteger finalScore;
@property GameScene* theScene;
-(instancetype) initWithSize:(CGSize)size ;
-(void) updated;
@end
