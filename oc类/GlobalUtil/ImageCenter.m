//
//  ImageCenter.m
//  iHummingBird
//
//  Created by Tang Shilei on 14-10-4.
//  Copyright (c) 2014年 HummingBird. All rights reserved.
//

#import "ImageCenter.h"

@implementation ImageCenter

+ (UIImage *)getImage:(NSString *)path
{
    return [ImageCenter getImage:path source:PhotoSource_Path];
}

+ (UIImage *)getBundleImage:(NSString *)name
{
    return [ImageCenter getImage:name source:PhotoSource_Bundle];
}

+ (UIImage *)getNamedImage:(NSString *)name
{
    return [ImageCenter getImage:name source:PhotoSource_Named];
}

+ (UIImage *)getBundleImageFromName:(NSString *)name
{
    return [self getImage:name source:PhotoSource_Bundle];
}

+ (UIImage *)getImage:(NSString *)path source:(NSInteger)source
{
    NSCache *dict = [[ImageCenter shareInstance] getImageDict:source];
    UIImage *image = [dict objectForKey:path];
    if (image == nil) {
        image = [ImageCenter getImageFromPath:path source:source];
        if (image != nil && path != nil) {
            [dict setObject:image forKey:path];
        }
    }
    return image;
}

+ (void)releaseImage:(NSString *)path
{
    for (int i=0; i<PhotoSource_All; i++) {
        [[[ImageCenter shareInstance] getImageDict:i] removeObjectForKey:path];
    }
}

+ (void)releaseImages:(NSString *)key source:(NSInteger)source
{
    if (source == PhotoSource_All) {
        for (int i=0; i<PhotoSource_All; i++) {
            [[[ImageCenter shareInstance] getImageDict:i] removeAllObjects];
        }
    } else {
        [[[ImageCenter shareInstance] getImageDict:source] removeAllObjects];
    }
}

+ (UIImage *)getImageFromPath:(NSString *)path
{
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    UIImage *image = [[UIImage alloc] initWithData:data];
    return image;
}

 BOOL isRetina;
+ (void)setRetina:(BOOL)tf
{
    isRetina = tf;
}

+ (NSInteger)getSizeCopies
{
    return isRetina == YES ? 2 : 1;
}

+ (UIImage *)getImageFromPath:(NSString *)path source:(NSInteger)source
{
    BOOL isRetinaImage = NO;
    UIImage *image = nil;
    if (path == nil || path.length == 0) {
        
    } else if (source == PhotoSource_Path) {
        image = [ImageCenter getImageFromPath:path];
    } else if (source == PhotoSource_Bundle) {
        NSString *newPath = nil;
        if (isRetina == YES) {
            NSRange range = [path rangeOfString:@"." options:NSBackwardsSearch];
            if (range.location != NSNotFound) {
                NSString *path2 = [NSString stringWithFormat:@"%@@2x.%@", [path substringToIndex:range.location], [path substringFromIndex:range.location+1]];
                newPath = [[NSBundle mainBundle] pathForResource:path2 ofType:nil];
                isRetinaImage = YES;
            } else {
                newPath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
            }
        } else {
            newPath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
        }
        image = [ImageCenter getImageFromPath:newPath];
        if (image == nil && isRetinaImage == YES) {
            newPath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
            image = [ImageCenter getImageFromPath:newPath];
        }
    } else {
        image = [UIImage imageNamed:path];
    }
    return image;
}

+ (ImageCenter *)shareInstance
{
    static ImageCenter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[ImageCenter alloc] init];
            if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2) {
                [ImageCenter setRetina:YES];
            } else {
                [ImageCenter setRetina:NO];
            }
        }
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        nameDict = [[NSCache alloc] init];
        pathDict = [[NSCache alloc] init];
        bundleDict = [[NSCache alloc] init];
    }
    return self;
}

- (NSCache *)getImageDict:(NSInteger)source
{
    NSCache *dict = nil;
    if (source == PhotoSource_Bundle) {
        dict = bundleDict;
    } else if (source == PhotoSource_Named) {
        dict = nameDict;
    } else if (source == PhotoSource_Path) {
        dict = pathDict;
    }
    return dict;
}

+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage*)scaleFromImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    CGSize imageSize=image.size;
    CGFloat width=imageSize.width;
    CGFloat height=imageSize.height;
    if(width<=newSize.width&&height<=newSize.height)
    {
        return image;
    }
    
    if(width==0||height==0)
    {
        return image;
    }
    
    CGFloat widthFactor=newSize.width/width;
    CGFloat heightFactor=newSize.height/height;
    CGFloat scaleFactor=(widthFactor<heightFactor?widthFactor:heightFactor);
    CGFloat scaledWidth=width*scaleFactor;
    CGFloat scaledHeight=height*scaleFactor;
    CGSize targetSize=CGSizeMake(scaledWidth, scaledHeight);
    UIGraphicsBeginImageContext(targetSize);
    [image drawInRect:CGRectMake(0,0,scaledWidth,scaledHeight)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
