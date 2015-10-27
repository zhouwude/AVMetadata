//
//  UIImage+Color.h
//  网易彩票2014MJ版
//
//  Created by 沐汐 on 14-9-13.
//  Copyright (c) 2014年 沐汐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extend.h"

@interface UIImage (Color)
-(UIImage*)safeResizableImageWithCapInsets:(UIEdgeInsets)capInsets;

/**
 *  给图片加水印图片
 *
 *  @param image   水印图片
 *  @param imgRect 水印图片所在位置，大小
 *  @param alpha   水印图片的透明度，0~1之间，透明度太大会完全遮盖被加水印图片的那一部分
 *
 *  @return 加完水印的图片
 */
- (UIImage*)imageWaterMarkWithImage:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha;
/**
 *  同上
 *
 *  @param image    同上
 *  @param imgPoint 水印图片（0，0）所在位置
 *  @param alpha    同上
 *
 *  @return 同上
 */
- (UIImage*)imageWaterMarkWithImage:(UIImage*)image imagePoint:(CGPoint)imgPoint alpha:(CGFloat)alpha;

/**
 *  给图片加文字水印
 *
 *  @param str     水印文字
 *  @param strRect 文字所在的位置大小
 *  @param attri   文字的相关属性，自行设置
 *
 *  @return 加完水印文字的图片
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str rect:(CGRect)strRect attribute:(NSDictionary *)attri;
/**
 *  同上
 *
 *  @param str      同上
 *  @param strPoint 文字（0，0）点所在位置
 *  @param attri    同上
 *
 *  @return 同上
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str point:(CGPoint)strPoint attribute:(NSDictionary*)attri;
/**
 *  返回加水印文字和图片的图片
 *
 *  @param str      水印文字
 *  @param strPoint 文字（0，0）点所在位置
 *  @param attri    文字属性
 *  @param image    水印图片
 *  @param imgPoint 图片（0，0）点所在位置
 *  @param alpha    透明度
 *
 *  @return 加完水印的图片
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str point:(CGPoint)strPoint attribute:(NSDictionary*)attri image:(UIImage*)image imagePoint:(CGPoint)imgPoint alpha:(CGFloat)alpha;
/**
 *  同上
 *
 *  @param str     同上
 *  @param strRect 文字的位置大小
 *  @param attri   同上
 *  @param image   同上
 *  @param imgRect 图片的位置大小
 *  @param alpha   透明度
 *
 *  @return 同上
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str rect:(CGRect)strRect attribute:(NSDictionary *)attri image:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha;
//给我一种颜色，一个尺寸，我给你返回一个UIImage:不透明
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;




- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
//可以给UIImage添加一个分类UIImage+Extension
//分类中增加一个返回圆形图片的方法,扩展性强
- (UIImage *)circleImage;
/**
 *  以中心点拉伸图片
 *
 *  @param tmpImage 要拉伸的图片
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithImage:(UIImage *)tmpImage;

/**
 *  UIColor转图片
 *
 *  @param imageName 图片名称
 *  @param frame     显示的区域
 *
 *  @return UIColor对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  图片圆形
 *
 *  @param image 图片
 *  @param inset 范围
 *
 *  @return 圆形图片
 */
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;

/**
 *  屏幕截图
 *
 *  @return 屏幕图像
 */
+ (UIImage *)screenshot;

/**
 *  (截图)截取某个view的图片
 *
 *  @param 要截图的view
 *
 *  @return view的截图
 */
+ (UIImage *)screenshotWithView:(UIView *)view;

/**
 *  图像等比压缩
 *
 *  @param size 大小
 *
 *  @return 压缩后的图像
 */
- (UIImage*)scaleToSize:(CGSize)size;

/**
 *  设置透明
 *
 *  @return 透明图片
 */
- (UIImage *)fillAlpha;

/**
 *  设置图片透明根据某个颜色进行透明
 *
 *  @param color 颜色
 *
 *  @return 透明图片
 */
- (UIImage *)fillAlphaWithColor:(UIColor *)color;

/**
 *  是否为灰色图片
 *
 *  @return YES/NO
 */
- (BOOL)isGrayscale;

/**
 *  图片变灰
 *
 *  @return 灰度图片
 */
- (UIImage *)imageToGrayscale;

/**
 *  图片变黑白
 *
 *  @return 黑白图片
 */
- (UIImage *)imageToBlackAndWhite;

/**
 *  图片模糊
 *
 *  @param blur 模糊值
 *
 *  @return 模糊后的图片
 */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;


+ (UIImage *)snapshot:(UIView *)view;
/**
 *  矩形裁剪
 *
 *  @param cropRect <#cropRect description#>
 *
 *  @return <#return value description#>
 */
- (UIImage*)cropImageWithRect:(CGRect)cropRect;
// 矩形裁剪2
-(UIImage *)cropImageWithRect1:(CGRect)cropRect;
-(UIImage *)bigImageToPointArray:(CGPoint )point1 point2:(CGPoint )point2 point3:(CGPoint )point3 point4:(CGPoint )point4;
@end
