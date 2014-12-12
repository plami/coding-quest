//
//  Scores.h
//  CodingQuest
//
//  Created by User-16 on 12/12/14.
//  Copyright (c) 2014 User-06. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Scores : NSObject

-(void) createScoreNode: (SKScene*) scene;
-(void) updateScore: (SKScene*) scene newScore: (int) playerScore hiScore: (int) highScore;


@end
