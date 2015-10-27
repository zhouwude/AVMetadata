//
//  ZWDObjectDetector.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//
// 检测一个对象是否被释放
#import "ZWDObjectDetector.h"
#ifndef GCDExecOnce
#define GCDExecOnce(block) \
{ \
static dispatch_once_t predicate = 0; \
dispatch_once(&predicate, block); \
}
#endif

static NSHashTable        *_table          = nil;
static dispatch_source_t   _dispatchSource = nil;
static dispatch_queue_t    _dispatchQueue  = nil;
@implementation ZWDObjectDetector
+ (void)initialize
{
    if (self == [ZWDObjectDetector class])
    {
        _table          = [NSHashTable weakObjectsHashTable];
        _dispatchQueue  = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
        _dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _dispatchQueue);
        
        dispatch_source_set_timer(_dispatchSource,
                                  dispatch_time(DISPATCH_TIME_NOW, 0),
                                  NSEC_PER_SEC,
                                  0);
        
        dispatch_source_set_event_handler(_dispatchSource, ^{
            NSLog(@"\n[==ObjectDetector LIST==]\n%@", _table);
        });
    }
}

+ (void)startWatch
{
    GCDExecOnce(^{
        dispatch_resume(_dispatchSource);
    });
}

+ (void)addToWatch:(id)object
{
    if (object == nil)
    {
        NSLog(@"object should not be nil.");
        return;
    }
    
    if ([_table containsObject:object] == NO)
    {
        [_table addObject:object];
    }
}

+ (NSArray *)allObjects
{
    return [_table allObjects];
}

@end
