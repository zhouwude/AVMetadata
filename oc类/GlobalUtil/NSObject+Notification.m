//
//  NSObject+Notification.m
//  iHummingBird
//
//  Created by Tang Shilei on 14-10-29.
//  Copyright (c) 2014年 HummingBird. All rights reserved.
//

#import "NSObject+Notification.h"
#import <objc/runtime.h>
static char key;
@implementation NSObject (Notification)


-(void)registerNotification:(NSString *)notify block:(void (^)(NSNotification *))block
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify:) name:notify object:nil];
    objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)notify:(NSNotification*)notify
{
    callback_notificaion_block block=objc_getAssociatedObject(self, &key);
    
    if(block)
        block(notify);
    
    
}


@end
