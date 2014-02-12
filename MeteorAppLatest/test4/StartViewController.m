//
//  StartViewController.m
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/30.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import "StartViewController.h"
#import "RankViewController.h"
@interface StartViewController ()

@end

@implementation StartViewController

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
    NSString* bgmpath = [[NSBundle mainBundle]
                         pathForResource:@"cheeter2" ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:bgmpath];
    sound = [[AVAudioPlayer alloc]
             initWithContentsOfURL:url error:nil];
    [sound setNumberOfLoops:0];
    [sound play];
    
	// Do any additional setup after loading the view.
    [self imageName];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"aText"];
    [userDefaults synchronize];
    
    
    UIImage *backgroundimage;UIImage *backgroundImage = [UIImage imageNamed:@"haikei2"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    CGRect meteo = CGRectMake(0, 10, 350, 250);
    meteor = [[UIImageView alloc]initWithFrame:meteo];
    
    
    CGRect meteohito = CGRectMake(135, 203, 160, 70);
    meteorh = [[UIImageView alloc]initWithFrame:meteohito];
    
    CGRect wakuse1 = CGRectMake(163, 170, 20, 20);
    wakusei1 = [[UIImageView alloc]initWithFrame:wakuse1];
    
    CGRect wakuse2 = CGRectMake(140, 170, 20, 20);
    wakusei2 = [[UIImageView alloc]initWithFrame:wakuse2];
    
    CGRect wakuse3 = CGRectMake(184, 170, 28, 20);
    wakusei3 = [[UIImageView alloc]initWithFrame:wakuse3];
    
    meteor.image = [UIImage imageNamed:@"メテオ.png"];
    meteorh.image = [UIImage imageNamed:@"meteohito-5.png"];
    wakusei1.image = [UIImage imageNamed:@"wakusei-2.png"];
    wakusei2.image = [UIImage imageNamed:@"wakusei2-2.png"];
    wakusei3.image = [UIImage imageNamed:@"wakusei3.png"];
    
    [self.view addSubview:meteor];
    //    [self.view addSubview:meteorh];
    [self.view addSubview:wakusei1];
    [self.view addSubview:wakusei2];
    [self.view addSubview:wakusei3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startbuttom:(id)sender {
    [sound stop];
}

- (IBAction)nextrank:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"aText"];
    [userDefaults synchronize];
    
    
}

- (IBAction)rank:(id)sender {
}

- (IBAction)goback:(UIStoryboardSegue *)segue {[sound play];}

- (void)imageName{
    /* UIImage *backgroundImage = [UIImage imageNamed:@"メテオロゴ.jpeg"];
     //    self.view.contentMode = UIViewContentModeScaleAspectFit;
     self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];*/
    
}


@end
