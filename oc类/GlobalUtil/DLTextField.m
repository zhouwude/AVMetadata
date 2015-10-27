//
//  DLTextField.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
#import "DLTextField.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
@implementation DLTextField
//改变uitextfield placeholder的颜色和位置
-(void)drawPlaceholderInRect:(CGRect)rect
{
    if (self.placeholderTextColor != nil || self.placeholderFont != nil)
    {
        if (self.placeholderTextColor)
        {
            [self.placeholderTextColor setFill];
        }
        [self.placeholder drawInRect:rect withFont:(self.placeholderFont != nil ? self.placeholderFont : self.font) lineBreakMode:NSLineBreakByClipping alignment:self.textAlignment];
       //[self.placeholder drawInRect:rect withAttributes:@{}];
        
    }
    else
    {
        [super drawPlaceholderInRect:rect];
    }
}
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.textInsets))
    {
        return [super editingRectForBounds:bounds];
    }
    UIEdgeInsets i = self.textInsets;
    return CGRectMake(bounds.origin.x + i.left, bounds.origin.y + i.top,
                      bounds.size.width - i.left - i.right, bounds.size.height - i.top - i.bottom);
}
-(CGRect)textRectForBounds:(CGRect)bounds
{
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.textInsets))
    {
        return [super textRectForBounds:bounds];
    }
    UIEdgeInsets i = self.textInsets;
    return CGRectMake(bounds.origin.x + i.left, bounds.origin.y + i.top,
                      bounds.size.width - i.left - i.right, bounds.size.height - i.top - i.bottom);
}
@end
#pragma clang diagnostic pop