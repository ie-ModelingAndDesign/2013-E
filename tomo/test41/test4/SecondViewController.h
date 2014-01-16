//
//  SecondViewController.h
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/29.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITextFieldDelegate> {
    //前の画面から受け取る引数
    NSString *_arguments;
}

@property (nonatomic) NSString *arguments;
@property (weak, nonatomic) IBOutlet UILabel *argumentsLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backButtonEvent:(id)sender;
#define aText @"TextKey"
-(void) saveDefault;
- (IBAction)Starthe:(id)sender;


@end
