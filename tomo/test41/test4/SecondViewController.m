//
//  SecondViewController.m
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/29.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize arguments = _arguments;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //ラベルに前の画面から受け取った引数を表示
    self.argumentsLabel.text = _arguments;
}

- (IBAction)backButtonEvent:(id)sender {
    //前の画面へ戻る
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void) saveDefault
{
    //　aTextの中身をユーザーデフォルトに保存
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject : self.argumentsLabel.text forKey : aText];
    [userDefaults synchronize];
}

- (IBAction)Starthe:(id)sender {
    [self saveDefault];
}

@end
