//
//  ViewController.h
//  Modeling
//
//  Created by Kazuki YOZA on 2013/11/28.
//  Copyright (c) 2013年 Kazuki YOZA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
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
