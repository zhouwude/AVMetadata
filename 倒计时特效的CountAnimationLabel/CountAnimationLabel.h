//
//  CountAnimationLabel.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CountAnimationLabel : UIView
@property (nonatomic, strong) NSString *text;       // 文本的文字
@property (nonatomic, strong) UIFont   *font;       // 文本的字体

@property (nonatomic, assign) CGFloat   startScale; // 最初处于alpha = 0状态时的scale值
@property (nonatomic, assign) CGFloat   endScale;   // 最后处于alpha = 0状态时的scale值

@property (nonatomic, strong) UIColor  *backedLabelColor; // 不会消失的那个label的颜色


@property (nonatomic, assign) NSTimeInterval  fadeInDuration;   // 默认值为1s
@property (nonatomic, assign) NSTimeInterval  fadeOutDuration;  // 默认值为2s
@property (nonatomic, assign) NSTimeInterval  showDuration;     // 默认值为0.5s
@property (nonatomic, assign) BOOL            removeOnComplete; // 动画结束后是否被移除掉

- (void)startAnimation;
@end
