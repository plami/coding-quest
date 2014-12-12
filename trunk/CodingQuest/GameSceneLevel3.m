

#import "GameSceneLevel3.h"
#import "Player.h"
#import "Background.h"
//#import "Bug.h"
#import "Bullet.h"

@interface GameSceneLevel3 ()
@property Player* player;
@property SKTextureAtlas* runAtlas;
@property Background* scrollingBackground;
@property Bullet* bullet;
//@property Bug* bug;
@end

@implementation GameSceneLevel3
-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if(self){
        //background set
        self.backgroundColor = [SKColor whiteColor];
        
        
        NSString* imageName = [NSString stringWithFormat:@"spaceshipBackground.jpg"];
        Background* scrollingBackground = [[Background alloc]initWithBackground: imageName size:size speed:2];
        self.scrollingBackground = scrollingBackground;
        [self addChild: self.scrollingBackground];
        [self.scrollingBackground setScale:2.1];
        
//       initiate player
        _player = [Player initNewPlayer3:self startingPoint:CGPointMake(20, 40)];
        [_player runOnPlace];
        
        //shoot button
        NSString *ShootButton;
        ShootButton = @"Shoot";
        
        SKLabelNode *myShootLabel = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        
        myShootLabel.text = ShootButton;
        myShootLabel.fontSize = 20;
        myShootLabel.fontColor = [SKColor colorWithRed:0.1 green:0.3 blue:1.5 alpha:0.9];
        myShootLabel.position = CGPointMake(self.frame.size.width- 100, 20);
        myShootLabel.name = @"shoot";
        
        [self addChild:myShootLabel];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    [self.scrollingBackground update:currentTime];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"shoot"]) {
        
        _bullet = [Bullet initNewBullet3:self startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
        [_bullet shoot];
    }
    
}
-(void)didMoveToView:(SKView *)view{
    
    
}
@end
