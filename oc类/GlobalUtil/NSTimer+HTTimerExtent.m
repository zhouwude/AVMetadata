//
//  NSTimer+HTTimerExtent.m
//  LifeCamera
//
//  Created by 周武德 on 15/9/1.
//  Copyright (c) 2015年 haitangshiji. All rights reserved.
//

#import "NSTimer+HTTimerExtent.h"

@implementation NSTimer (HTTimerExtent)
+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(eoc_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)eoc_blockInvoke:(NSTimer*)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}
@end
