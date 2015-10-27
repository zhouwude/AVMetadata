//
//  DLTouchID.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation DLTouchID

+ (void)showTouchIDAuthenticationWithReason:(NSString *)reason completion:(void (^)(TouchIDResult result))completion
{
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error = nil;
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reason reply:^(BOOL success, NSError *error) {
            if(success)
            {
                completion(TouchIDResultSuccess);
            }
            else
            {
                switch(error.code)
                {
                    case LAErrorAuthenticationFailed:
                        completion(TouchIDResultAuthenticationFailed);
                        break;
                    case LAErrorUserCancel:
                        completion(TouchIDResultUserCancel);
                        break;
                    case LAErrorUserFallback:
                        completion(TouchIDResultUserFallback);
                        break;
                    case LAErrorSystemCancel:
                        completion(TouchIDResultSystemCancel);
                        break;
                    default:
                        completion(TouchIDResultError);
                        break;
                }
            }
        }];
    }
    else
    {
        switch(error.code)
        {
            case LAErrorPasscodeNotSet:
                completion(TouchIDResultPasscodeNotSet);
                break;
            case LAErrorTouchIDNotAvailable:
                completion(TouchIDResultNotAvailable);
                break;
            case LAErrorTouchIDNotEnrolled:
                completion(TouchIDResultNotEnrolled);
                break;
            default:
                completion(TouchIDResultError);
                break;
        }
    }
}

@end
