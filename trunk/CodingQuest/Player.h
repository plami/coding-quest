#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
@interface Player : SKSpriteNode

-(instancetype)initWithHeroImage: (NSString*) image;

+(Player*) initNewPlayer:(GameScene*) whichScene startingPoint: (CGPoint) location;

-(void) runRight;
-(void) jumpRight;
@end
