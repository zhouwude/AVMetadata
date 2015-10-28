//
//  GlobalNormalTime.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "GlobalNormalTime.h"
static NSDateFormatter* _DMLogDateFormatter = nil;
@implementation GlobalNormalTime
+ (void)initialize
{
    if (self == [GlobalNormalTime class]) {
        // 日期格式
        _DMLogDateFormatter = [[NSDateFormatter alloc] init];
        [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        [_DMLogDateFormatter setDateFormat:@"HH:mm:ss"];
    }
}

+ (NSArray *)currentTime
{
    NSString *timerNow = [_DMLogDateFormatter stringFromDate:[NSDate date]];
    NSArray *timeArray = [timerNow componentsSeparatedByString:@":"];
    return timeArray;
}

+ (float)currentSecond
{
    NSString *timerNow = [_DMLogDateFormatter stringFromDate:[NSDate date]];
    NSArray *timeArray = [timerNow componentsSeparatedByString:@":"];
    
    // 获取到时间
    float sec =  [timeArray[2] intValue];
    return sec;
}

+ (float)currentMinute
{
    NSString *timerNow = [_DMLogDateFormatter stringFromDate:[NSDate date]];
    NSArray *timeArray = [timerNow componentsSeparatedByString:@":"];
    
    // 获取到时间
    float min =  [timeArray[1] intValue];
    return min;
}

+ (float)currentHour
{
    NSString *timerNow = [_DMLogDateFormatter stringFromDate:[NSDate date]];
    NSArray *timeArray = [timerNow componentsSeparatedByString:@":"];
    
    // 获取到时间
    float hour =  [timeArray[0] intValue];
    return hour;
}

@end
