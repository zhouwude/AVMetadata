//
//  UILabel+Factory.m
//  ctoffice
//
//  Created by TangShiLei on 13-9-25.
//  Copyright (c) 2013年 xugang. All rights reserved.
//

#import "UILabel+Factory.h"
//#import <CoreText/CoreText.h>
@implementation UILabel (Factory)


+(UILabel*)labelWithFrame:(CGRect)frame withText:(NSString *)text withFont:(UIFont *)font withTextColor:(UIColor *)color withBackgroundColor:(UIColor *)bgColor
{
    
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.font=font;
    label.textColor=color;
    label.backgroundColor=bgColor;
    return label;
}

+(void)loadFontResource:(NSString *)name fontType:(NSString *)type{
//    NSURL *fontUrl = [[NSBundle mainBundle] URLForResource:name withExtension:type];
//    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontUrl);
//    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
//    CGDataProviderRelease(fontDataProvider);
//    CFErrorRef error = NULL;
//    CTFontManagerRegisterGraphicsFont(newFont, &error);
//    CGFontRelease(newFont);
}

@end
