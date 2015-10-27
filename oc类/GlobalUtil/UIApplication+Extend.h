//
//  UIApplication+Extend.h
//  Carpenter
//
//  Created by 冯成林 on 15/4/24.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extend)


/*
 *  当前程序的版本号
 */
@property (nonatomic,copy,readonly) NSString *version;
/**
 *  获取document目录
 *
 *  @return document目录
 */
- (NSURL *)documentsDirectoryURL;

/**
 *  获取缓存目录
 *
 *  @return 缓存目录
 */
- (NSURL *)cachesDirectoryURL;

/**
 *  获取下载目录
 *
 *  @return 下载目录
 */
- (NSURL *)downloadsDirectoryURL;

/**
 *  获取library目录
 *
 *  @return library目录
 */
- (NSURL *)libraryDirectoryURL;

/**
 *  获取Support目录
 *
 *  @return Support目录
 */
- (NSURL *)applicationSupportDirectoryURL;

@end
