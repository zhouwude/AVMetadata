//
//  Configuration.m
//  Teleconference
//
//  Created by XUGANG on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

#pragma mark aboutPath

+(NSString*)GetHomeDirectoryPath
{
    return NSHomeDirectory();
}

+(NSString*)GetDocumentPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    return path;
}

+(NSString*)getCachePath:(NSString *)filePath
{
    NSArray *Paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path=[Paths objectAtIndex:0];
    path=[path stringByAppendingPathComponent:filePath];
    
    return path;
}

+(NSString *)GetLibraryPath
{
    NSArray *Paths=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path=[Paths objectAtIndex:0];
    return path;
}

+(NSString *)GetTmpPath
{
    return NSTemporaryDirectory();
}


+(void)DeleteFile:(NSString *)filepath
{
    if([[NSFileManager defaultManager]fileExistsAtPath:filepath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
    }
}

+(NSString*)getDocumentFileDirectoryPath:(NSString*)fileName
{
    NSFileManager *file_manager = [NSFileManager defaultManager];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *doc_dir=[paths objectAtIndex:0];
    doc_dir= [doc_dir stringByAppendingPathComponent:@"attachments"];
    if(![self isFileExist:doc_dir])
    {
       //创建文件目录
       [file_manager createDirectoryAtPath:doc_dir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [doc_dir stringByAppendingPathComponent:fileName];
}

+(NSString*)getDocumentFilePath:(NSString*)fileName
{
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doc_dir=[paths objectAtIndex:0];
	return[doc_dir stringByAppendingPathComponent:fileName];
}


+(NSString *)findBundleFilePath:(NSString *)fileName ofType:(NSString *)type{
	return [[NSBundle mainBundle] pathForResource:fileName ofType:type];
}

+(NSString *)getBundleFilePath:(NSString *)fileName
{
	return [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:fileName];
}

+(BOOL)isFileExist:(NSString *)filePath{
	
	NSFileManager *file_manager = [NSFileManager defaultManager];
    return [file_manager fileExistsAtPath:filePath];
}



////唯一标示符
+(NSString*)stringWithUUID
{
    CFUUIDRef uuidObj=CFUUIDCreate(nil);
    NSString *uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return uuidString;
}

////应用app version build
+(NSString*)getAppVersion{
    NSString * version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    
    NSString * build = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
    
    return [NSString stringWithFormat:@"%@.%@",version,build];
}

@end
