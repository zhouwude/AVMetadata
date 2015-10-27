//
//  Configuration.h
//  Teleconference
//
//  Created by XUGANG on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject

//获取程序的 document 带文件夹的路径
+(NSString*)getDocumentFileDirectoryPath:(NSString*)fileName;
//获取程序的Home目录路径
+(NSString *)GetHomeDirectoryPath;
//获取document目录路径
+(NSString *)GetDocumentPath;
//获取Cache目录路径
+(NSString *)getCachePath:(NSString*)filePath;
//获取Library目录路径
+(NSString *)GetLibraryPath;
//获取Tmp目录路径
+(NSString *)GetTmpPath;


//获得路径函数
//fileName:文件名
+(NSString*)getDocumentFilePath:(NSString*)fileName;
//获得路径函数
//fileName:文件名
//type:	文件类型
+(NSString *)findBundleFilePath:(NSString *)fileName ofType:(NSString *)type;
//获得路径函数
//fileName:文件名
+(NSString *)getBundleFilePath:(NSString *)fileName;
//获得路径函数
//fileName:文件名
+(BOOL)isFileExist:(NSString *)filePath;

+(NSString*)stringWithUUID;
+(NSString*)getAppVersion;
@end
