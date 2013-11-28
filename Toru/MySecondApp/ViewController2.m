//
//  ViewController2.m
//  MySecondApp
//
//  Created by Toru NAKANDAKARI on 2013/11/21.
//  Copyright (c) 2013年 Toru NAKANDAKARI. All rights reserved.
//

#import "ViewController2.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController2 ()


@end

@implementation ViewController2

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
	// Do any additional setup after loading the view.
    
    // UIImageViewの初期化
    CGRect rect = CGRectMake(100, 200, 100, 100);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    CGRect rect1 = CGRectMake(0, 400, 50, 50);
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:rect1];
    
    // 画像の読み込み
    imageView.image = [UIImage imageNamed:@"ネス.png"];
    imageView1.image = [UIImage imageNamed:@"火澄.jpeg"];
    
    imageView.tag = 10;
    
    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageView];
    [self.view addSubview:imageView1];
    
    /* 移動 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // アニメーションのオプションを設定
    animation.duration = 1.5; // アニメーション速度
    animation.repeatCount = HUGE_VALF; // 繰り返し回数
    
    // 始点と終点を設定
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 400)]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(350,400)]; // 終点
    
    // アニメーションを追加
    [imageView1.layer addAnimation:animation forKey:@"move-layer"];
    
    // ボタンの作成と設定
    UIButton *MeteoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    MeteoButton.frame = CGRectMake(40, 160, 240, 40);
    [MeteoButton setTitle:@"メテオ" forState:UIControlStateNormal];
    [MeteoButton addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MeteoButton];
}

    // メテオボタンが押された時のメソッド
    // 画像が敵機の方へ移動する
- (void)action

{
    NSLog(@"ボタンがおされました");
    UIImageView *uiImageView = (UIImageView*)[self.view viewWithTag:10];
    uiImageView.image = [UIImage imageNamed:@"ネス.png"];
    uiImageView.frame = CGRectMake(100,350,100,100);
    [self.view addSubview:uiImageView];
    
    // 0.1秒遅れて、changeImageメソッドを呼び出す
    [self performSelector:@selector(changeImage:)withObject:uiImageView afterDelay:0.1];
}


    // メテオ後に画像を元に戻すメソッド(遅延を利用)
- (void)changeImage:(UIImageView *)imageView
{
    imageView.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:imageView];
 
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
