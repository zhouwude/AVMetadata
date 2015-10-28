//
//  CountAnimationLabel.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "CountAnimationLabel.h"
@interface CountAnimationLabel ()

@property (nonatomic, strong) UILabel  *backedLabel;

@end

@implementation CountAnimationLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backedLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        // 初始时的alpha值为0
        _backedLabel.alpha = 0;
        
        // 文本居中
        _backedLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_backedLabel];
    }
    return self;
}

- (void)startAnimation
{
    // 判断endScale的值
    if (_endScale == 0) {
        _endScale = 2.f;
    }
    
    // 开始第一次动画
    [UIView animateWithDuration:(_fadeInDuration > 0 ?_fadeInDuration : 1.f)
                          delay:0
         usingSpringWithDamping:7
          initialSpringVelocity:4
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // 恢复正常尺寸
                         _backedLabel.alpha     = 1.f;
                         _backedLabel.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                     }
                     completion:^(BOOL finished) {
                         
                         // 开始第二次动画
                         [UIView animateWithDuration:(_fadeOutDuration > 0 ? _fadeOutDuration : 2.f)
                                               delay:(_showDuration > 0 ? _showDuration : 0.5f)
                              usingSpringWithDamping:7
                               initialSpringVelocity:4
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              _backedLabel.alpha     = 0.f;
                                              _backedLabel.transform = CGAffineTransformMake(_endScale, 0, 0, _endScale, 0, 0);
                                          }
                                          completion:^(BOOL finished) {
                                              if (_removeOnComplete == YES) {
                                                  [self removeFromSuperview];
                                              }
                                          }];
                     }];
}

#pragma mark - 重写setter，getter方法
#pragma mark - 重写setter方法
@synthesize text = _text;
- (void)setText:(NSString *)text
{
    _text             = text;
    _backedLabel.text = text;
}
- (NSString *)text
{
    return _text;
}

@synthesize startScale = _startScale;
- (void)setStartScale:(CGFloat)startScale
{
    _startScale = startScale;
    _backedLabel.transform = CGAffineTransformMake(startScale, 0, 0, startScale, 0, 0);
}
- (CGFloat)startScale
{
    return _startScale;
}

@synthesize font = _font;
- (void)setFont:(UIFont *)font
{
    _font = font;
    _backedLabel.font = font;
}
- (UIFont *)font
{
    return _font;
}

@synthesize backedLabelColor = _backedLabelColor;
- (void)setBackedLabelColor:(UIColor *)backedLabelColor
{
    _backedLabelColor = backedLabelColor;
    _backedLabel.textColor = backedLabelColor;
}

@end
