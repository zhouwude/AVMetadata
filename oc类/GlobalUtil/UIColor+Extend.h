//
//  UIColor+Extend.h
//  Wifi
//
//  Created by muxi on 14/11/19.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];



@interface UIColor (Extend)




/**
 *  十六进制颜色
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;






/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha;


/**
 *  将图片转为UIColor对象
 *
 *  @param imageName 图片名称
 *  @param frame     显示的区域
 *
 *  @return UIColor对象
 */
+ (UIColor *)ImageToColorWithName:(NSString *)imageName frame:(CGRect)frame;



/**
 *  颜色渐变
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 高
 *
 *  @return 渐变后的颜色
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

/**
 *  随机颜色
 *
 *  @return 随机颜色
 */
+ (UIColor *)randomColor;



@end
