//
//  ViewController.m
//  WHCountDownButtonDemo
//
//  Created by deyi on 15/8/26.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "ViewController.h"
#import "WHCountdownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WHCountdownButton *btn = [WHCountdownButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.frame = CGRectMake(100, 100, 150, 35);
    btn.prefixStr = @"第";
    btn.suffixStr = @"秒";
    btn.nomalText = @"发送验证码";
    btn.startTime = 7;
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    btn.enableColor = [UIColor colorWithRed:196/255.0 green:23/255.0 blue:75/255.0 alpha:1];
    btn.disableColor = [UIColor grayColor];

    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click:(WHCountdownButton *)btn{
    [btn startCountdown];
}

@end
