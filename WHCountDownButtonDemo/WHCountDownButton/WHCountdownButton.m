//
//  WHCountdownButton.m
//  WHCountDownButtonDemo
//
//  Created by deyi on 15/8/26.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "WHCountdownButton.h"

@implementation WHCountdownButton

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
#pragma mark - setter

- (void)setEnableColor:(UIColor *)enableColor
{
    _enableColor = enableColor;

    [self setBackgroundColor:enableColor];

}

- (void)setDisableColor:(UIColor *)disableColor
{
    _disableColor = disableColor;
}

- (void)setNomalText:(NSString *)nomalText
{
    _nomalText  = nomalText;
    [self setTitle:nomalText forState:UIControlStateNormal];
}

//- (void)setStartTime:(NSInteger)startTime
//{
//    _startTime = startTime;
//    NSString *tempStr = [NSString stringWithFormat:@" %@%ld%@ ", _prefixStr, startTime, _suffixStr];
//    [self setTitle:tempStr forState:UIControlStateDisabled];
//}

#pragma mark - action

- (void)startCountdown
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tempStartTime = self.startTime;
    });

    self.titleLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.titleLabel.alpha = 1.0;

    if (self.startTime && self.startTime > 0) {
        self.backgroundColor = self.disableColor ? self.disableColor : [UIColor lightGrayColor];
        NSString *tempStr = [NSString stringWithFormat:@" %@%ld%@ ", _prefixStr, _startTime, _suffixStr];
         NSLog(@"%@",tempStr);
        [self setTitle:tempStr forState:UIControlStateDisabled];
        [self setEnabled:NO];
        __weak typeof (self) weakSelf = self;
        [UIView animateWithDuration:1.0 animations:^{
            self.titleLabel.transform = CGAffineTransformMakeScale(1.10, 1.10);
            self.titleLabel.alpha = 0.0;
        } completion:^(BOOL finished) {
            _startTime -- ;
            [weakSelf startCountdown];
        }];
    }
    else if (self.startTime == 0){
        [self setEnabled:YES];
        self.enableColor = _enableColor;
        self.nomalText = _nomalText;
        self.startTime = _tempStartTime;
    }
}

@end
