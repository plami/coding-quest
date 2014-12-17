#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Button :SKSpriteNode

-(instancetype)initWithScene: (SKScene*) scene;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event andScene: (SKScene*) scene;

-(SKSpriteNode* ) fireButton;

@end
