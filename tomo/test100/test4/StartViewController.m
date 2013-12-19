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
    [sound setNumberOfLoops:-1];
    [sound play];
    
	// Do any additional setup after loading the view.
    [self imageName];

    
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

}

- (IBAction)rank:(id)sender {
    }

- (IBAction)goback:(UIStoryboardSegue *)segue {}

- (void)imageName{
    UIImage *backgroundImage = [UIImage imageNamed:@"メテオロゴ.jpeg"];
    //    self.view.contentMode = UIViewContentModeScaleAspectFit;
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
}


@end
