//
//  GlobalNormalTime.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalNormalTime : NSObject
/**
 *  当前时间的数组
 *
 *  @return 返回有3个元素的数组(0处为小时，1处为分钟，2处为秒)
 */
+ (NSArray *)currentTime;

/**
 *  当前秒
 *
 *  @return 当前秒
 */
+ (float)currentSecond;

/**
 *  当前分钟
 *
 *  @return 当前分钟
 */
+ (float)currentMinute;

/**
 *  当前小时
 *
 *  @return 当前小时
 */
+ (float)currentHour;

@end
