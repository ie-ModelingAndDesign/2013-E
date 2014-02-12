//
//  ViewController.m
//  test4
//
//  Created by Tomoki OOSHIRO on 2013/11/29.
//  Copyright (c) 2013年 Tomoki OOSHIRO. All rights reserved.
//
#define MYRAND(min, max) ((arc4random()/(float)UINT_MAX)*((max)-(min))+(min))
#import "ViewController.h"
#import "SecondViewController.h"
#import "RankViewController.h"

@interface ViewController (){
    unsigned int score;
    UILabel *scoreLabel;
    int LifeCount;
    int a;
}


@end

@implementation ViewController

- (IBAction)plus:(id)sender {
    
    

    a += 1;
    [self viewDidLoad];
    self.plus.hidden = YES;
}

-(void)a{
    //UIImage *backgroundImage2 = [UIImage imageNamed:@"syuutenn.jpg"];
    //   self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    //[backgroundImage2 release];

    if(a == 0){
    [super viewDidLoad];
    
    
    NSString* bgmpath = [[NSBundle mainBundle]
                         pathForResource:@"ti-ta-" ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:bgmpath];
    sound = [[AVAudioPlayer alloc]
             initWithContentsOfURL:url error:nil];
    [sound setNumberOfLoops:-1];
    [sound play];
        
        // 残機数
        CGRect rect2 = CGRectMake(10, 15, 30, 30);
        LifeIV = [[UIImageView alloc]initWithFrame:rect2];
        
        CGRect rect3 = CGRectMake(40, 15, 30, 30);
        LifeIV1 = [[UIImageView alloc]initWithFrame:rect3];
        
        CGRect rect4 = CGRectMake(70, 15, 30, 30);
        LifeIV2 = [[UIImageView alloc]initWithFrame:rect4];
        
        // UIImageViewの初期化
        CGRect rect = CGRectMake(125, 200, 70, 70);
        NessIV = [[UIImageView alloc]initWithFrame:rect];


    }
}


- (void)viewDidLoad
    {

    UIImage *backgroundImage2 = [UIImage imageNamed:@"syuutenn.jpg"];
    //   self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    //[backgroundImage2 release];
    [self a];
    score = 0;
    scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(110,200,50,50)];
   
    LifeCount = 3;
    
   // CGRect rect1 = CGRectMake(0, 400, 50, 50);
    CGRect rect1 = CGRectMake(-50, 380, 50, 50);
    EnemyIV = [[UIImageView alloc]initWithFrame:rect1];
    
    
    // 画像の読み込み
    NessIV.image = [UIImage imageNamed:@"uness.png"];
    EnemyIV.image = [UIImage imageNamed:@"ball.png"];
    
    LifeIV.image = [UIImage imageNamed:@"heart.png"];
    LifeIV1.image = [UIImage imageNamed:@"heart.png"];
    LifeIV2.image = [UIImage imageNamed:@"heart.png"];

    [self.view addSubview:LifeIV];
    [self.view addSubview:LifeIV1];
    [self.view addSubview:LifeIV2];
    
    NessIV.tag = 10;
    
    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:scoreLabel];
    [self.view addSubview:NessIV];
    [self.view addSubview:EnemyIV];
    
    /* 移動 */
    animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // アニメーションのオプションを設定
    animation.duration = 1.5; // アニメーション速度
    animation.repeatCount = HUGE_VALF; // 繰り返し回数
    
    
    // 始点と終点を設定
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 400)]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(350,400)]; // 終点
    
    // アニメーションを追加
    [EnemyIV.layer addAnimation:animation forKey:@"move-layer"];
    
    // ボタンの作成と設定
    UIButton *MeteoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    MeteoButton.frame = CGRectMake(40, 160, 240, 40);
    [MeteoButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [MeteoButton setTitle:@"メテオ" forState:UIControlStateNormal];
    //(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
    [MeteoButton addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MeteoButton];
    
}


//画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"secondSegue"]) {
        //ここでパラメータを渡す
        SecondViewController *secondViewController = segue.destinationViewController;
        secondViewController.arguments = _arguments;
    }
}


// メテオボタンが押された時のメソッド
// 画像が敵機の方へ移動する
- (void)action

{
    NSLog(@"ボタンがおされました");
    NessIV = (UIImageView*)[self.view viewWithTag:10];
    NessIV.image = [UIImage imageNamed:@"attackness.png"];
    NessIV.frame = CGRectMake(125,350,70,70);
    [self.view addSubview:NessIV];
    
    // 0.1秒遅れて、changeImageメソッドを呼び出す
    [self performSelector:@selector(changeImage:)withObject:NessIV afterDelay:0.1];
    
    // 当たり判定の座標取得
    CGPoint center;
    center = NessIV.center;
    NessX = center.x;
    NessY = center.y;
    
    CALayer *mLayer = [EnemyIV.layer presentationLayer];
    EnemyX = mLayer.position.x+25;
    EnemyY = mLayer.position.y-25;
    
    
    NSLog(@"NessX:%.f",NessX);
    NSLog(@"NessY:%.f",NessY);
    
    NSLog(@"EnemyX:%.f",EnemyX);
    NSLog(@"EnemyY:%.f",EnemyY);
    
    // 当たり判定
    float distanceX = (NessX-EnemyX); // キャラと敵のx座標の距離の差
    float distanceY = (NessY-EnemyY); // キャラと敵のy座標の距離の差
    float distance = ((distanceX*distanceX) + (distanceY*distanceY)); // キャラと敵の距離の差
    
    if(distance < 45*45){
        NSLog(@"ATARI:%.1f", distance);
        [self EnemyMove:EnemyX];
    //スコア
        score++;
        NSLog(@"score:%d",score);
        //scoreLabel.text = [[NSString alloc] initWithFormat:@”%d%”,score];
        [scoreLabel setText:[[NSString alloc] initWithFormat:@"%d",score]];
        [scoreLabel setTextAlignment:UITextAlignmentLeft];
        [scoreLabel setTextColor:[UIColor whiteColor]];
        [scoreLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]];//太文字

        
        NSString* bgmpath2 = [[NSBundle mainBundle]
                             pathForResource:@"bakuha" ofType:@"mp3"];
        NSURL* url2 = [NSURL fileURLWithPath:bgmpath2];
        sound2 = [[AVAudioPlayer alloc]
                 initWithContentsOfURL:url2 error:nil];
        [sound2 setNumberOfLoops:0];
        [sound2 play];
        //
        CGRect rect5 = CGRectMake(20, 30, 30, 30);
        Efect = [[UIImageView alloc]initWithFrame:rect5];
        Efect.image = [UIImage imageNamed:@""];
        //
        

        
    }
    else {
        LifeCount--;
        
        switch(LifeCount){
            case 2:
                [LifeIV2 removeFromSuperview];
                break;
                
            case 1:
                [LifeIV1 removeFromSuperview];
                break;
                
            case 0:
                [LifeIV removeFromSuperview];
                    [self saveDefault];
                RankViewController *rankViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"svc"];
                [self presentViewController:rankViewController animated:YES completion:nil];
                break;
        }
       
    }
    NSString* moji;
    moji = [ NSString stringWithFormat : @"%d", score];
    _arguments = moji;
}

// メテオ後に画像を元に戻すメソッド(遅延を利用)
- (void)changeImage:(UIImageView *)NessIV
{
    NessIV.frame = CGRectMake(125, 200, 50, 50);
    [self.view addSubview:NessIV];
    
}

// メテオ成功時のメソッド
- (void)EnemyMove:(float)EnemyX
{
    // 移動
    NSLog(@"敵のx座標:%.1f", EnemyX);
    /* 移動 */
    
    // アニメーションのオプションを設定
    animation.duration = 0.4; // アニメーション速度
    animation.repeatCount = HUGE_VALF; // 繰り返し回数
    
    // 始点と終点を設定
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(EnemyX, 400)]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(EnemyX,550)]; // 終点
    
    // アニメーションを追加
    [EnemyIV.layer addAnimation:animation forKey:@"move2-layer"];
    
    // アニメーション再開
    CFTimeInterval pausedTime = [EnemyIV.layer timeOffset];
    EnemyIV.layer.speed = 1.0;
    EnemyIV.layer.timeOffset = 0.0;
    EnemyIV.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [EnemyIV.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    EnemyIV.layer.beginTime = timeSincePause;

    [self performSelector:@selector(changeAnimation:)withObject:EnemyIV afterDelay:0.4];
    [self performSelector:@selector(startGIF)withObject:nil afterDelay:0.4];
}
    
    
    - (void) startGIF
    {
        CGRect rect = CGRectMake(85, 320, 150, 250);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        [self.view addSubview:imageView];
        
        // アニメーション用画像を配列にセット
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 0; i < 11; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"エフェクト%d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        // アニメーション用画像をセット
        imageView.animationImages = imageList;
        
        // アニメーションの速度
        imageView.animationDuration = 0.2;
        
        // アニメーションのリピート回数
        imageView.animationRepeatCount = 1;
        
        //アニメーション実行
        [imageView startAnimating];
    }
     
    
    
    

// メテオ後のアニメーションを最初からやり直す
- (void)changeAnimation:(UIImageView*)EnemyIV
{

    float speed;
    
    // 敵機のスピード調整
    if(score < 5){
        speed = MYRAND(1.00, 1.50); // 1.00 ~ 1.50までの乱数を発生
    }
    
    else if(score < 10){
        speed = MYRAND(0.9, 1.4);
    }
    
    else if(score < 15){
        speed = MYRAND(0.8, 1.3);
    }
    
    
    else if(score < 20){
        speed = MYRAND(0.7, 1.2);
    }
    
    
    else if(score < 25){
        speed = MYRAND(0.6, 1.2);
    }
    
    
    else if(score < 30){
        speed = MYRAND(0.5, 1.1);
    }
    
    
    else if(score < 35){
        speed = MYRAND(0.5, 1.0);
    }
    
    else if(score < 40){
        speed = MYRAND(0.5, 0.9);
    }
    
    else if(score < 45){
        speed = MYRAND(0.5, 0.8);
    }
    
    else if(score < 50){
        speed = MYRAND(0.5, 0.7);
    }
    
    else{
        speed = 0.4;
    }
    // 始点と終点を設定
    animation.duration = speed; // アニメーション速度
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 400)]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(350,400)]; // 終点
    
    // アニメーションを追加
    [EnemyIV.layer addAnimation:animation forKey:@"move2-layer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)finishbuttom:(id)sender {
    [sound stop];
}
- (void) saveDefault
{
    //　aTextの中身をユーザーデフォルトに保存
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:score forKey:@"aText"];
    [userDefaults synchronize];
}
@end

