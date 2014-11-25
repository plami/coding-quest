#import "Player.h"

@interface Player ()

@property NSString* heroImage;

@end

@implementation Player

-(instancetype)initWithHeroImage:(NSString *)image{
    self = [super init];
    if(self){
        self.heroImage = image;
    }
    return self;
}

@end
