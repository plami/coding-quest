#import <SpriteKit/SpriteKit.h>
#import "SpriteTextures.h"
#import "GameScene.h"
#import "Constants.h"

@interface Bonus : SKSpriteNode

typedef enum: int{
    CoinFacingLeft
}BonusStatus;

@property BonusStatus bonusStatus;

+(Bonus*) initNewBonus: (SKScene*)whichScene startingPoint:(CGPoint) location;

-(void)addedInScene:(SKScene *)whichScene;
-(void) moveLeft;

@end
