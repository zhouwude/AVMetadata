//
//  NSTimer+HTTimerExtent.h
//  LifeCamera
//
//  Created by 周武德 on 15/9/1.
//  Copyright (c) 2015年 haitangshiji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (HTTimerExtent)
//防止NSTimer和调用对象之间的循环引用
+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats;

@end
