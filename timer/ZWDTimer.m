//
//  ZWDTimer.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//
#ifdef DEBUG
#define ZWDTimer_DLog(fmt, ...) NSLog((@"ZWDTimer.m:%s:%d" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ZWDTimer_DLog(...)
#endif
#import "ZWDTimer.h"
@interface ZWDTimer ()

@property (nonatomic) BOOL isRunning;
@property (nonatomic, copy) void (^block)(ZWDTimer *timer);

@end
@implementation ZWDTimer
- (instancetype)init
{
    self = [super init];
    if (self) {
        _isRunning = NO;
    }
    return self;
}

- (instancetype)initWithBlock:(void (^)(ZWDTimer *timer))block {
    self = [super init];
    
    if (self) {
        _isRunning = NO;
        _block     = block;
    }
    
    return self;
}
//激活定时器
- (void)start {
    _isRunning = YES;
    [self runTimer];
}
//停止定时器 要学让定时器释放  一定要stop方法才行
- (void)stop {
    _isRunning = NO;
}

+ (instancetype)timerWithMilliSecondInterval:(NSTimeInterval)milliSecond
                                       Block:(void (^)(ZWDTimer *timer))block {
    ZWDTimer *timer = [[ZWDTimer alloc] initWithBlock:block];
    timer.milliSecond = milliSecond;
    
    return timer;
}

- (void)runTimer {
    
    if (self.isRunning) {
        
        NSTimeInterval  milliSecond = 1000.f;
        if (_milliSecond > 0) {
            milliSecond = _milliSecond;
        }
        //NSEC_PER_SEC  秒
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(milliSecond * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            if (self.block) {
                self.block(self);
            }
            
            if (_delegate) {
                [_delegate ZWDTimerEvent:self];
            }
            
            [self runTimer];
        });
    }
}

- (void)dealloc {
    [self stop];
    ZWDTimer_DLog(@"资源释放了");
}

@end

