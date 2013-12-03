//
//  ViewController.m
//  Modeling
//
//  Created by Kazuki YOZA on 2013/11/28.
//  Copyright (c) 2013年 Kazuki YOZA. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController


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
    CGRect rect = CGRectMake(125, 250, 50, 50);
    kirinIV = [[UIImageView alloc]initWithFrame:rect];
    
    CGRect rect1 = CGRectMake(0, 375, 50, 50);
    lionIV = [[UIImageView alloc]initWithFrame:rect1];
    
    
    // 画像の読み込み
    kirinIV.image = [UIImage imageNamed:@"kirin.png"];
    lionIV.image = [UIImage imageNamed:@"lion.png"];
    
    kirinIV.tag = 10;


    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:kirinIV];
    [self.view addSubview:lionIV];
    
    
    /* 移動 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    
    // アニメーションのオプションを設定
    animation.duration = 1.5; // アニメーション速度
    animation.repeatCount = HUGE_VALF; // 繰り返し回数
    
    // 始点と終点を設定
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 400)]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(350,400)]; // 終点
    
    // アニメーションを追加
    [lionIV.layer addAnimation:animation forKey:@"move-layer"];

    
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
    uiImageView.image = [UIImage imageNamed:@"kirin.png"];
    uiImageView.frame = CGRectMake(125, 375, 50, 50);
    [self.view addSubview:uiImageView];
    
    // 0.1秒遅れて、changeImageメソッドを呼び出す
    [self performSelector:@selector(changeImage:)withObject:uiImageView afterDelay:0.1];
    
    CGPoint center;
    center = kirinIV.center;
    kirinX = center.x;
    kirinY = center.y;
    
    center = lionIV.center;
    lionX = center.x;
    lionY = center.y;

    NSLog(@"kirinX:%.f", kirinX);
    NSLog(@"kirinY:%.f", kirinY);
    
    NSLog(@"lionX:%.f", lionX);
    NSLog(@"lionY:%.f", lionY);

    
    // 当たり判定
    float kyori = (kirinX-lionX)*(kirinX-lionX) + (kirinY-lionY)*(kirinY-lionY);
    
    if(kyori < 50.0*50.0){
        NSLog(@"ATARI:%.1f", kyori);
    }
    else {
        NSLog(@"HAZURE:%.1f", kyori);
    }
    
}



// メテオ後に画像を元に戻すメソッド(遅延を利用)
- (void)changeImage:(UIImageView *)imageView
{
    imageView.frame = CGRectMake(125, 250, 50, 50);
    [self.view addSubview:imageView];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end