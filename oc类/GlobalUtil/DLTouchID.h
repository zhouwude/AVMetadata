//
//  DLTouchID.h
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TouchIDResult) {
    TouchIDResultSuccess = 0,
    TouchIDResultError,
    TouchIDResultAuthenticationFailed,
    TouchIDResultUserCancel,
    TouchIDResultUserFallback,
    TouchIDResultSystemCancel,
    TouchIDResultPasscodeNotSet,
    TouchIDResultNotAvailable,
    TouchIDResultNotEnrolled
};

@interface DLTouchID : NSObject

+ (void)showTouchIDAuthenticationWithReason:(NSString *)reason completion:(void (^)(TouchIDResult result))completion;

@end
