//
//  UIApplication+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "UIApplication+Extend.h"

@implementation UIApplication (Extend)


/*
 *  当前程序的版本号
 */
-(NSString *)version{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    
    return versionValueStringForSystemNow;
}
#pragma mark - 获取document目录
- (NSURL *)documentsDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - 获取缓存目录
- (NSURL *)cachesDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - 获取下载目录
- (NSURL *)downloadsDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask] lastObject];
}
#pragma mark - 获取library目录
- (NSURL *)libraryDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}
#pragma mark - 获取lSupport目录
- (NSURL *)applicationSupportDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
}
/** navigationbar弄成透明的而不是带模糊的效果*/
-(void)changNav{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].shadowImage = [UIImage new];
    [UINavigationBar appearance].translucent = YES;
}

@end
