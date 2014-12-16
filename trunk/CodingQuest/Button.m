#import "Button.h"
#import "Bullet.h"
#import "Player.h"

@interface Button ()

@property Bullet* bullet;
@property Player* player;

@property NSString* image;

@end

@implementation Button


#pragma mark Init Method

-(instancetype)initWithImageNamed:(NSString *)name andScene: (SKScene*) scene{
    self = [super init];
    
    if(self){
        self.image = name;
        self.name = @"fireButton";
        self.zPosition = 1.0;
        self.size = CGSizeMake(50, 50);
    }
    return self;
}


#pragma mark Setting the Fire Button

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event andScene: (SKScene*) scene{
    
    PlayerStatus status = _player.playerStatus;
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"fireButton"]){
        _bullet = [Bullet initNewBullet3:scene startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
        
        [_bullet shootRight];
        
        //adding collision logic between bullet and monster
        _bullet.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_bullet.frame.size];
        _bullet.physicsBody.restitution = 0.1f;
        _bullet.physicsBody.friction = 0.4f;
        
        // make physicsBody static
        _bullet.physicsBody.dynamic = YES;
        _bullet.name = @"bullet";
        
        _bullet.physicsBody.categoryBitMask = bulletCategory;
        _bullet.physicsBody.contactTestBitMask = monsterCategory;
        _bullet.physicsBody.collisionBitMask = 0;
        
    }
    if (status == PlayerFacingLeft || status == PlayerRunningLeft || status == PlayerSkiddingLeft ){
        _bullet = [Bullet initNewBulletLeft3:scene startingPoint:CGPointMake(self.player.position.x, self.player.position.y)];
        [_bullet shootLeft];
    }
    
}


@end
