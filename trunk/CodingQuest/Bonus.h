#import <SpriteKit/SpriteKit.h>
#import "SpriteTextures.h"
#import "GameScene.h"
#import "Constants.h"

@interface Bonus : SKSpriteNode

typedef enum: int{
    CoinFacingLeft
}BonusStatus;

@property (readonly)BonusStatus bonusStatus;

+(Bonus*) initNewBonus: (SKScene*)whichScene startingPoint:(CGPoint) location;

-(void)addedInScene:(SKScene *)whichScene;
-(void) moveLeft;
-(void) spawnInSceneVerticaly;
@end
