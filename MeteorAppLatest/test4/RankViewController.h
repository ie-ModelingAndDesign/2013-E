//
//  RankViewController.h
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/30.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
@interface RankViewController : UIViewController<UITextFieldDelegate>{
    AVAudioPlayer *sound;
}
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (weak, nonatomic) IBOutlet UILabel *Label3;
@property (weak, nonatomic) IBOutlet UILabel *Label4;
@property (weak, nonatomic) IBOutlet UILabel *Label5;
@property (weak, nonatomic) IBOutlet UILabel *Label6;
@property (weak, nonatomic) IBOutlet UILabel *Label7;
@property (weak, nonatomic) IBOutlet UILabel *Label8;
@property (weak, nonatomic) IBOutlet UILabel *Label9;
@property (weak, nonatomic) IBOutlet UILabel *Label10;

#define aarray @"arrayKey"
#define aarray1 @"arrayKey1"
#define aarray2 @"arrayKey2"
#define aarray3 @"arrayKey3"
#define aarray4 @"arrayKey4"
#define aarray5 @"arrayKey5"
#define aarray6 @"arrayKey6"
#define aarray7 @"arrayKey7"
#define aarray8 @"arrayKey8"
#define aarray9 @"arrayKey9"
#define aarray10 @"arrayKey10"
#define aarray11 @"arrayKey11"
#define aText @"TextKey"

- (void) arrayDefault;


@end
UIImageView *rank1;
UIImageView *rank2;
UIImageView *rank3;
UIImageView *rank4;
UIImageView *rank5;
UIImageView *rank6;
UIImageView *rank7;
UIImageView *rank8;
UIImageView *rank9;
UIImageView *rank10;
UIImage *backgroundimage;