//
//  ViewController2.h
//  MySecondApp
//
//  Created by Toru NAKANDAKARI on 2013/11/21.
//  Copyright (c) 2013年 Toru NAKANDAKARI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController2 : UIViewController
- (void)action;
- (void)changeImage:(id)NessIV;
- (void)EnemyMove:(float)EnemyX;
- (void)changeAnimation:(id)EnemyIV;
@end

UIImageView *NessIV;
UIImageView *EnemyIV;
UIImageView *EnemyIV2;
CABasicAnimation *animation;

float NessX , NessY , EnemyX , EnemyY;