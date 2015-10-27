//
//  ZWDFile.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FILE_PATH(filePath)       [File path:(filePath)]
#define ROOT_PATH                 [File rootPath]
#define BUNDLE_PATH(fileName)     [File bundleSource:(fileName)]
#define CREATE_FOLDER(folderPath) [File createFolder:(folderPath)]
#define FILE_EXIST(filePath)      [File exist:(filePath)]
#define IS_DIRECTORY(filePath)    [File isDirectory:(filePath)]
#define IS_FILE(filePath)         ![File isDirectory:(filePath)]
#define FILE_INFO(filePath)       [File fileInfo:(filePath)]
#define FILE_SIZE(filePath)       [File fileSize:(filePath)]
#define FILE_DICTIONARY(filePath) [File dictionaryFrom:(filePath)]
#define FILE_ARRAY(filePath)      [File arrayFrom:(filePath)]
@interface ZWDFile : NSObject
/*
 注意:凡是参数为 filePath folderPath 的全部为相对路径,用以下字符串拼接使用
 
 /Documents
 /Library/Caches
 /Library/Preferences
 /tmp
 
 其他都为绝对路径
 */
+ (NSString *)rootPath;
+ (NSString *)bundleSource:(NSString *)fileName;
+ (NSString *)path:(NSString *)filePath;
+ (BOOL)createFolder:(NSString *)filePath;
+ (BOOL)exist:(NSString *)filePath;
+ (BOOL)isDirectory:(NSString *)filePath;
+ (NSDictionary *)fileInfo:(NSString *)filePath;
+ (int)fileSize:(NSString *)filePath;
+ (NSArray *)enumeratorFolder:(NSString *)folderPath;
+ (void)enumeratorFolder:(NSString *)folderPath each:(void (^)(NSString *path))each;

+ (BOOL)copyFrom:(NSString *)sourcePath to:(NSString *)targetPath;
+ (BOOL)moveFrom:(NSString *)sourcePath to:(NSString *)targetPath;
+ (BOOL)remove:(NSString *)targetPath;

+ (BOOL)writePlist:(id)plist to:(NSString *)filePath;
+ (NSMutableDictionary *)dictionaryFrom:(NSString *)filePath;
+ (NSMutableArray *)arrayFrom:(NSString *)filePath;
+ (void)path:(NSString *)filePath dictionary:(void (^)(NSMutableDictionary *dictionary))dictionary;
+ (void)path:(NSString *)filePath array:(void (^)(NSMutableArray *array))array;
@end
