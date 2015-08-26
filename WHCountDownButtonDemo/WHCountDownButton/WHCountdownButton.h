//
//  WHCountdownButton.h
//  WHCountDownButtonDemo
//
//  Created by deyi on 15/8/26.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHCountdownButton : UIButton

/**
 *  nomal状态文本
 */
@property (nonatomic, copy) NSString *nomalText;

/**
 *  倒计时时前缀
 */
@property (nonatomic, copy) NSString *prefixStr;

/**
 *  倒计时后缀
 */
@property (nonatomic, copy) NSString *suffixStr;

/**
 *  倒计时时间
 */
@property (nonatomic, assign) NSInteger startTime;

/**
 *  临时变量
 */
@property (nonatomic, assign) NSInteger tempStartTime;

/**
 *  正在倒计时的背景色
 */
@property (nonatomic, strong) UIColor *disableColor;

/**
 *  nomal背景色
 */
@property (nonatomic, strong) UIColor *enableColor;

/**
 *  点击按钮时调用开始倒计时
 */
- (void)startCountdown;
@end
