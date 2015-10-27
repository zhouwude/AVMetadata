//
//  UILabel+Factory.h
//  ctoffice
//
//  Created by TangShiLei on 13-9-25.
//  Copyright (c) 2013年 xugang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Factory)

+(UILabel*)labelWithFrame:(CGRect)frame withText:(NSString*)text withFont:(UIFont*)font withTextColor:(UIColor*)color withBackgroundColor:(UIColor*)bgColor;

@end
