//
//  RankViewController.m
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/30.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import "RankViewController.h"
#import "StartViewController.h"
#import "SecondViewController.h"
@interface RankViewController ()

@end

@implementation RankViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{



    [super viewDidLoad];
//    [self arrayDefault];
  
    

    

    
    // Do any additional setup after loading the view.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name_textStr = [userDefaults stringForKey:aText];
    
    // 文字列をNSIntegerに変換
    
    NSInteger string = name_textStr.integerValue;

    NSUserDefaults *arrayDefaults = [NSUserDefaults standardUserDefaults];



    
    NSInteger array0,array1,array2,array3,array4,array5;
    
   
    array0 = [arrayDefaults integerForKey:@"aarray"];
    array1 = [arrayDefaults integerForKey:@"aarray1"];
    array2 = [arrayDefaults integerForKey:@"aarray2"];
    array3 = [arrayDefaults integerForKey:@"aarray3"];
    array4 = [arrayDefaults integerForKey:@"aarray4"];
    array5 = string;
    
    [userDefaults setInteger : 0 forKey : aText];
    [userDefaults synchronize];

    


    int arraysize=6;

    int brray[] = {array0,array1,array2,array3,array4,array5};
    int i;
    int temp;

    for (i = 0; i < arraysize - 1; i++) {
        for (int j = arraysize - 1; j > i; j--) {
            if (brray[j - 1] < brray[j]) {
                temp = brray[j];
                brray[j] = brray[j - 1];
                brray[j - 1]= temp;
            }
        }
    }

    
    [arrayDefaults setInteger:brray[0] forKey:@"aarray"];
    [arrayDefaults setInteger:brray[1] forKey:@"aarray1"];
    [arrayDefaults setInteger:brray[2] forKey:@"aarray2"];
    [arrayDefaults setInteger:brray[3] forKey:@"aarray3"];
    [arrayDefaults setInteger:brray[4] forKey:@"aarray4"];
    [arrayDefaults setInteger:brray[5] forKey:@"aarray5"];
    


    self.Label1.text = [NSString stringWithFormat:@"%d",brray[0]];
    self.Label2.text = [NSString stringWithFormat:@"%d",brray[1]];
    self.Label3.text = [NSString stringWithFormat:@"%d",brray[2]];
    self.Label4.text = [NSString stringWithFormat:@"%d",brray[3]];
    self.Label5.text = [NSString stringWithFormat:@"%d",brray[4]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) arrayDefault
{

    NSInteger array[]={0,0,0,0,0,0};

    // Do any additional setup after loading the view.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name_textStr = [userDefaults stringForKey:aText];
    
    // 文字列をNSIntegerに変換
    
    NSInteger string = name_textStr.integerValue;

    array[5] = string;
    NSUserDefaults *arrayDefaults = [NSUserDefaults standardUserDefaults];
    [arrayDefaults setInteger:array[0] forKey:@"aarray"];
    [arrayDefaults setInteger:array[1] forKey:@"aarray1"];
    [arrayDefaults setInteger:array[2] forKey:@"aarray2"];
    [arrayDefaults setInteger:array[3] forKey:@"aarray3"];
    [arrayDefaults setInteger:array[4] forKey:@"aarray4"];
    [arrayDefaults setInteger:array[5] forKey:@"aarray5"];


}







@end
