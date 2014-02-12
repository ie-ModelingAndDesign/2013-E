//
//  StartViewController.h
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/30.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface StartViewController : UIViewController{
    AVAudioPlayer *sound;
}
- (IBAction)startbuttom:(id)sender;

- (IBAction)nextrank:(id)sender;
- (IBAction)rank:(id)sender;
- (void) imageName;
#define aText @"TextKey"
@end

UIImageView *meteor;
UIImageView *meteorh;
UIImageView *wakusei1;
UIImageView *wakusei2;
UIImageView *wakusei3;