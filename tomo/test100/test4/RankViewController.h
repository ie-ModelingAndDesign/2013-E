//
//  RankViewController.h
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/30.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (weak, nonatomic) IBOutlet UILabel *Label3;
@property (weak, nonatomic) IBOutlet UILabel *Label4;
@property (weak, nonatomic) IBOutlet UILabel *Label5;
#define aarray @"arrayKey"
#define aarray1 @"arrayKey1"
#define aarray2 @"arrayKey2"
#define aarray3 @"arrayKey3"
#define aarray4 @"arrayKey4"
#define aarray5 @"arrayKey5"
#define aarray6 @"arrayKey6"
- (void) arrayDefault;

@end
