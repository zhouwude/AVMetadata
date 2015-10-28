//
//  ZWDStopWatch.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDStopWatch.h"
#import <QuartzCore/QuartzCore.h>
@interface ZWDStopWatch ()

@property (nonatomic, strong) CADisplayLink *countDownTimer;
@property (nonatomic, strong) NSDate        *startDate;
@property (nonatomic, strong) NSDate        *pausedDate;

@property (nonatomic, assign) BOOL           startFlag;

@end
@implementation ZWDStopWatch
- (void)start {
    _startFlag = YES;
    
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
    }
    
    if (_countDownTimer == nil) {
        if(_startDate == nil) {
            _startDate = [NSDate date];
        }
        
        if(_pausedDate != nil){
            NSTimeInterval countedTime = [_pausedDate timeIntervalSinceDate:_startDate];
            _startDate = [[NSDate date] dateByAddingTimeInterval:-countedTime];
            _pausedDate = nil;
        }
        
        _countDownTimer               = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerRunEvent)];
        _countDownTimer.frameInterval = 1;
        [_countDownTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {
    _startFlag = NO;
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
        _pausedDate     = [NSDate date];
    }
}

- (void)reset {
    _pausedDate = nil;
    _startDate  = [NSDate date];
    
    if (_delegate) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        [_delegate stopWatchDate:date];
    }
}

- (NSDate *)gainDate {
    if (_startFlag) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        return date;
    } else {
        return nil;
    }
}

- (void)timerRunEvent {
    if (_delegate) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        [_delegate stopWatchDate:date];
    }
}

- (void)dealloc {
    NSLog(@"xxxxxx");
}

@end
