//
//  AVMetadataInfo.h
//  AVMetadata
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface AVMetadataInfo : NSObject
/**
 获取音视频文件的Metadata信息(可以获取到mp3以及m4a的相关信息)
 
 *AVMetadataCommonKeyArtwork这个参数是可以换的,换不同的参数可以取得不同的值
 
 *[注意]此方法中用到了信号量将异步操作转换成了同步操作,尽量在主线程中使用
 
 @param fileURL 文件的URL地址
 @return 一个包含了相关内容的字典
 */
+ (NSDictionary *)dataInfoFromFileURL:(NSURL *)fileURL;
@end
