//
//  ZWDFile.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDFile.h"
static NSString *_sandBoxPath = nil;
@implementation ZWDFile
+ (void)initialize
{
    if (self == [ZWDFile class])
    {
        _sandBoxPath = NSHomeDirectory();
    }
}

+ (NSString *)rootPath
{
    return _sandBoxPath;
}

+ (NSString *)path:(NSString *)filePath
{
    return [_sandBoxPath stringByAppendingPathComponent:filePath];
}

+ (BOOL)createFolder:(NSString *)filePath
{
    return [[NSFileManager defaultManager] createDirectoryAtPath:[self path:filePath]
                                     withIntermediateDirectories:YES
                                                      attributes:nil
                                                           error:nil];
}

+ (NSString *)bundleSource:(NSString *)fileName
{
    return [[NSBundle mainBundle] pathForResource:fileName
                                           ofType:nil];
}

+ (BOOL)exist:(NSString *)filePath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[self path:filePath]
                                                isDirectory:NO];
}

+ (BOOL)isDirectory:(NSString *)filePath
{
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:[self path:filePath]
                                         isDirectory:&isDirectory];
    
    return isDirectory;
}

+ (BOOL)copyFrom:(NSString *)sourcePath to:(NSString *)targetPath
{
    return [[NSFileManager defaultManager] copyItemAtPath:sourcePath
                                                   toPath:targetPath
                                                    error:nil];
}

+ (BOOL)moveFrom:(NSString *)sourcePath to:(NSString *)targetPath
{
    return [[NSFileManager defaultManager] moveItemAtPath:sourcePath
                                                   toPath:targetPath
                                                    error:nil];
}

+ (BOOL)remove:(NSString *)targetPath
{
    return [[NSFileManager defaultManager] removeItemAtPath:targetPath
                                                      error:nil];
}

+ (NSArray *)enumeratorFolder:(NSString *)folderPath
{
    if ([self isDirectory:folderPath])
    {
        NSMutableArray *storeArray = [NSMutableArray array];
        
        NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:folderPath];
        NSFileManager *localFileManager = [[NSFileManager alloc] init];
        NSDirectoryEnumerator *dirEnum = [localFileManager enumeratorAtPath:docsDir];
        
        NSString *file;
        while ((file = [dirEnum nextObject]))
        {
            [storeArray addObject:[folderPath stringByAppendingPathComponent:file]];
        }
        
        return storeArray;
    }
    else
    {
        return nil;
    }
}

+ (void)enumeratorFolder:(NSString *)folderPath each:(void (^)(NSString *path))each
{
    if ([self isDirectory:folderPath])
    {
        NSMutableArray *storeArray = [NSMutableArray array];
        
        NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:folderPath];
        NSFileManager *localFileManager = [[NSFileManager alloc] init];
        NSDirectoryEnumerator *dirEnum = [localFileManager enumeratorAtPath:docsDir];
        
        NSString *file;
        while ((file = [dirEnum nextObject]))
        {
            [storeArray addObject:[folderPath stringByAppendingPathComponent:file]];
        }
        
        [storeArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            each(obj);
        }];
    }
}

+ (NSDictionary *)fileInfo:(NSString *)filePath
{
    return [[NSFileManager defaultManager] attributesOfItemAtPath:[self path:filePath]
                                                            error:nil];
}

+ (int)fileSize:(NSString *)filePath
{
    return [[[[NSFileManager defaultManager] attributesOfItemAtPath:[self path:filePath]
                                                              error:nil] \
             objectForKey:@"NSFileSize"] intValue];
}

+ (BOOL)writePlist:(id)plist to:(NSString *)filePath
{
    if ([plist isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *point = plist;
        
        return [point writeToFile:[self path:filePath]
                       atomically:YES];
    }
    else if ([plist isKindOfClass:[NSArray class]])
    {
        NSArray *point = plist;
        
        return [point writeToFile:[self path:filePath]
                       atomically:YES];
    }
    else
    {
        return NO;
    }
}

+ (NSMutableDictionary *)dictionaryFrom:(NSString *)filePath
{
    NSMutableDictionary *dictionary = \
    [[NSMutableDictionary alloc] initWithContentsOfFile:[self path:filePath]];
    
    return dictionary;
}

+ (NSMutableArray *)arrayFrom:(NSString *)filePath
{
    NSMutableArray *array = \
    [[NSMutableArray alloc] initWithContentsOfFile:[self path:filePath]];
    
    return array;
}

+ (void)path:(NSString *)filePath dictionary:(void (^)(NSMutableDictionary *dictionary))dictionary
{
    NSMutableDictionary *sourceDictionary = \
    [[NSMutableDictionary alloc] initWithContentsOfFile:[self path:filePath]];
    
    dictionary(sourceDictionary);
    
    [sourceDictionary writeToFile:[self path:filePath]
                       atomically:YES];
}

+ (void)path:(NSString *)filePath array:(void (^)(NSMutableArray *array))array
{
    NSMutableArray *sourceArray = \
    [[NSMutableArray alloc] initWithContentsOfFile:[self path:filePath]];
    
    array(sourceArray);
    
    [sourceArray writeToFile:[self path:filePath]
                  atomically:YES];
}
@end
