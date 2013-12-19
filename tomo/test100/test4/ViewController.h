#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController {
    //次の画面へ渡す引数
    NSString *_arguments;
    AVAudioPlayer *sound;
    IBOutlet UIButton *plus;

}


// add
//:(int)score;
- (void)action;
- (void)changeImage:(id)NessIV;
- (void)EnemyMove:(float)EnemyX:(int)score;
- (void)changeAnimation:(id)EnemyIV:(int)score;

- (void) imageithContentsOfFile;
- (void) imageName;
- (IBAction)finishbuttom:(id)sender;
@property (nonatomic) NSString *arguments;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (retain,nonatomic) IBOutlet UIButton *plus;
- (IBAction)plus:(id)sender;

@end
//------
unsigned int score;
float speed = 2.0;
//-------
// add
UIImageView *NessIV;
UIImageView *EnemyIV;
UIImageView *EnemyIV2;
CABasicAnimation *animation;
UIImageView *LifeIV;
UIImageView *LifeIV1;
UIImageView *LifeIV2;

float NessX , NessY , EnemyX , EnemyY;

