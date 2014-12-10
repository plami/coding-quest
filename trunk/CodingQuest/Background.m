#import "Background.h"

@interface Background ()


@property (nonatomic, strong) SKSpriteNode *background;
@property (nonatomic, strong) SKSpriteNode *mirrorBackground;
@property (nonatomic) CGFloat currentSpeed;


@end

@implementation Background

-(instancetype)initWithBackground:(NSString *)background size:(CGSize)size speed:(CGFloat)speed{
    
    self = [super init];
    if (self)
    {
        // load background image
        self.background = [[SKSpriteNode alloc] initWithImageNamed:background];
        
        // position background
        self.position = CGPointMake(size.width / 2, size.height / 1.25 );
        
        // speed
        self.currentSpeed = speed;
        
        // create duplicate background and insert location
        SKSpriteNode *node = self.background;
        node.position = CGPointMake(0, self.size.height);
        
        self.mirrorBackground = [node copy];
        CGFloat clonedPosX = node.position.x;
        CGFloat clonedPosY = node.position.y;
        clonedPosX = -node.size.width;
        
        self.mirrorBackground.position = CGPointMake(clonedPosX, clonedPosY);
        
        [self addChild:node];
        [self addChild:self.mirrorBackground];
    }
    
    return self;
}

- (void)update:(NSTimeInterval)currentTime
{
    CGFloat speed = self.currentSpeed;
    SKSpriteNode *bg = self.background;
    SKSpriteNode *cBg = self.mirrorBackground;
    
    CGFloat newBgX = bg.position.x, newBgY = bg.position.y,
    newCbgX = cBg.position.x, newCbgY = cBg.position.y;
    
    newBgX -= speed;
    newCbgX -= speed;
    if (newBgX <= -bg.size.width) newBgX += 2*bg.size.width;
    if (newCbgX <= -cBg.size.width) newCbgX += 2*cBg.size.width;
    
    bg.position = CGPointMake(newBgX, newBgY);
    cBg.position = CGPointMake(newCbgX, newCbgY);
}
@end
