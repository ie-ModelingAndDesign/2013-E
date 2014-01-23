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



    
    NSInteger array0,array1,array2,array3,array4,array5,array6,array7,array8,array9,array10,array11;
    
   
    array0 = [arrayDefaults integerForKey:@"aarray"];
    array1 = [arrayDefaults integerForKey:@"aarray1"];
    array2 = [arrayDefaults integerForKey:@"aarray2"];
    array3 = [arrayDefaults integerForKey:@"aarray3"];
    array4 = [arrayDefaults integerForKey:@"aarray4"];
    array5 = [arrayDefaults integerForKey:@"aarray5"];
    array6 = [arrayDefaults integerForKey:@"aarray6"];
    array7 = [arrayDefaults integerForKey:@"aarray7"];
    array8 = [arrayDefaults integerForKey:@"aarray8"];
    array9 = [arrayDefaults integerForKey:@"aarray9"];
    array10 = [arrayDefaults integerForKey:@"aarray10"];
    array11 = [userDefaults integerForKey:@"aText"];
    
    [userDefaults setInteger : 0 forKey : aText];
    [userDefaults synchronize];

    


    int arraysize=12;

    int brray[] = {array0,array1,array2,array3,array4,array5,array6,array7,array8,array9,array10,array11};
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
    [arrayDefaults setInteger:brray[6] forKey:@"aarray6"];
    [arrayDefaults setInteger:brray[7] forKey:@"aarray7"];
    [arrayDefaults setInteger:brray[8] forKey:@"aarray8"];
    [arrayDefaults setInteger:brray[9] forKey:@"aarray9"];
    [arrayDefaults setInteger:brray[10] forKey:@"aarray10"];
    [arrayDefaults setInteger:brray[11] forKey:@"aarray11"];
    


    self.Label1.text = [NSString stringWithFormat:@"%d",brray[0]];
    self.Label2.text = [NSString stringWithFormat:@"%d",brray[1]];
    self.Label3.text = [NSString stringWithFormat:@"%d",brray[2]];
    self.Label4.text = [NSString stringWithFormat:@"%d",brray[3]];
    self.Label5.text = [NSString stringWithFormat:@"%d",brray[4]];
    self.Label6.text = [NSString stringWithFormat:@"%d",brray[5]];
    self.Label7.text = [NSString stringWithFormat:@"%d",brray[6]];
    self.Label8.text = [NSString stringWithFormat:@"%d",brray[7]];
    self.Label9.text = [NSString stringWithFormat:@"%d",brray[8]];
    self.Label10.text = [NSString stringWithFormat:@"%d",brray[9]];

    

    
    CGRect rect1 = CGRectMake(0, 20, 100, 135);
    rank1 = [[UIImageView alloc]initWithFrame:rect1];
    
    CGRect rect2 = CGRectMake(15, 170, 80, 110);
    rank2 = [[UIImageView alloc]initWithFrame:rect2];
    
    CGRect rect3 = CGRectMake(25, 305, 60, 80);
    rank3 = [[UIImageView alloc]initWithFrame:rect3];
    
    CGRect rect4 = CGRectMake(190, 40, 30, 30);
    rank4 = [[UIImageView alloc]initWithFrame:rect4];
    
    CGRect rect5 = CGRectMake(190, 95, 30, 30);
    rank5 = [[UIImageView alloc]initWithFrame:rect5];
    
        CGRect rect6 = CGRectMake(190, 145, 30, 30);
    rank6 = [[UIImageView alloc]initWithFrame:rect6];
    
        CGRect rect7 = CGRectMake(190, 195, 30, 30);
    rank7 = [[UIImageView alloc]initWithFrame:rect7];
    
        CGRect rect8 = CGRectMake(190, 245, 30, 30);
    rank8 = [[UIImageView alloc]initWithFrame:rect8];
    
        CGRect rect9 = CGRectMake(190, 300, 30, 30);
    rank9 = [[UIImageView alloc]initWithFrame:rect9];

    CGRect rect10 = CGRectMake(190, 350, 30, 30);
    rank10 = [[UIImageView alloc]initWithFrame:rect10];
    

    rank1.image = [UIImage imageNamed:@"1.jpeg"];
    rank2.image = [UIImage imageNamed:@"2.jpeg"];
    rank3.image = [UIImage imageNamed:@"3.jpeg"];
    rank4.image = [UIImage imageNamed:@"4.jpeg"];
    rank5.image = [UIImage imageNamed:@"5.jpeg"];
    rank6.image = [UIImage imageNamed:@"6.jpeg"];
    rank7.image = [UIImage imageNamed:@"7.jpeg"];
    rank8.image = [UIImage imageNamed:@"8.jpeg"];
    rank9.image = [UIImage imageNamed:@"9.jpeg"];
    rank10.image = [UIImage imageNamed:@"10.jpeg"];
  

    [self.view addSubview:rank1];
    [self.view addSubview:rank2];
    [self.view addSubview:rank3];
    [self.view addSubview:rank4];
    [self.view addSubview:rank5];
    [self.view addSubview:rank6];
    [self.view addSubview:rank7];
    [self.view addSubview:rank8];
    [self.view addSubview:rank9];
    [self.view addSubview:rank10];
    
    
     UIImage *backgroundImage = [UIImage imageNamed:@"mony.jpeg"];
   //  self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];



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
