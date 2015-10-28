//
//  ZWDTimer.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZWDTimer;

@protocol ZWDTimerDelegete <NSObject>
- (void)ZWDTimerEvent:(ZWDTimer *)timer;
@end
@interface ZWDTimer : NSObject
// 代理相关方法
@property (nonatomic) NSTimeInterval              milliSecond; // 毫秒
@property (nonatomic, assign) id<ZWDTimerDelegete> delegate;


// block相关方法
+ (instancetype)timerWithMilliSecondInterval:(NSTimeInterval)milliSecond
                                       Block:(void (^)(ZWDTimer *timer))block;

// 激活定时器 + 停止定时器
- (void)start;
- (void)stop; // 注意：要想让timer能被移除，一定要激活stop方法才行
@end
