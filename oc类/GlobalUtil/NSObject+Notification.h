//
//  NSObject+Notification.h
//  iHummingBird
//
//  Created by Tang Shilei on 14-10-29.
//  Copyright (c) 2014年 HummingBird. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^callback_notificaion_block)(NSNotification*notification);
@interface NSObject (Notification)

-(void)registerNotification:(NSString*)notify block:(callback_notificaion_block)block;


@end
