//
//  ZWDStopWatch.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol StopWatchDelegate <NSObject>
- (void)stopWatchDate:(NSDate *)date;
@end
// 说明：此秒表类是基于CADisplayLink所写，每一帧刷新一次
@interface ZWDStopWatch : NSObject
@property (nonatomic, assign) id<StopWatchDelegate> delegate;

- (void)start;        // 开始
- (void)stop;         // 停止
- (void)reset;        // 复位
- (NSDate *)gainDate; // 获取时间（只有在start的时候获取时间才有意义，stop之后返回值为0）
@end
