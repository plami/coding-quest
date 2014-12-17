#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Background : SKSpriteNode

- (instancetype)initWithBackground:(NSString *)background
                    size:(CGSize)size
                             speed:(CGFloat)spee andMusic: (NSString*) sound;

- (void)update:(NSTimeInterval)currentTime;

@end
