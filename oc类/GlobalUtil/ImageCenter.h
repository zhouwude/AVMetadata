//
//  ImageCenter.h
//  iHummingBird
//
//  Created by Tang Shilei on 14-10-4.
//  Copyright (c) 2014年 HummingBird. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    PhotoSource_Bundle,
    PhotoSource_Path,
    PhotoSource_Named,
    PhotoSource_All
} Photo_Source;
@interface ImageCenter : NSObject
{
    NSCache *bundleDict;
    NSCache *pathDict;
    NSCache *nameDict;
}

+ (UIImage *)getBundleImageFromName:(NSString *)name;
+ (UIImage *)getImage:(NSString *)path;
+ (UIImage *)getBundleImage:(NSString *)name;
+ (UIImage *)getNamedImage:(NSString *)name;
+ (UIImage *)getImage:(NSString *)path source:(NSInteger)source;
+ (UIImage *)getImageFromPath:(NSString *)path source:(NSInteger)source;
+ (NSInteger)getSizeCopies;

+ (void)releaseImage:(NSString *)path;
+ (void)releaseImages:(NSString *)key source:(NSInteger)source;

+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect
;
+(UIImage*)scaleFromImage:(UIImage*)image scaledToSize:(CGSize)newSize;




@end
