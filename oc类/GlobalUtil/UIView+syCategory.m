//
//  UIView+syCategory.m
//  syUtil
//
//  Created by 世缘 on 15/2/3.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "UIView+syCategory.h"

@implementation UIView (syCategory)
#pragma mark - frame操作
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

#pragma mark -
+(id)create{
    return [[self alloc]init];
}

#pragma mark - 计算
#pragma mark 计算一个UIView的 endX = x坐标 + width + 格外加上的extraX
- (CGFloat)getEndXwith:(CGFloat)extraX{
    return self.frame.origin.x+self.frame.size.width+extraX;
}

#pragma mark 计算一个UIView的 endY = y坐标 + height + 格外加上的extraY
- (CGFloat)getEndYwith:(CGFloat)extraY{
    return self.frame.origin.y+self.frame.size.height+extraY;
}

#pragma mark 设置所有子view垂直居中
- (void)setSubViewsMiddle{
    if (self) {
        for (UIView *subview in self.subviews)
        {
            CGRect newCGRect = subview.frame;
            newCGRect.origin.y = (self.frame.size.height - subview.frame.size.height)/2.0f;
            subview.frame = newCGRect;
        }
    }
}

#pragma mark 设置所有子view水平居中
- (void)setSubViewsCenter{
    if (self) {
        for (UIView *subview in self.subviews)
        {
            CGRect newCGRect = subview.frame;
            newCGRect.origin.x = (self.frame.size.width - subview.frame.size.width)/2.0f;
            subview.frame = newCGRect;
        }
    }
}

#pragma mark 让view在父View中垂直居中
- (void)setUIViewMiddle{
    self.y=(self.superview.frame.size.height-self.frame.size.height)/2;
}

#pragma mark 让view在父View中水平居中
- (void)setUIViewCenter{
    self.x=(self.superview.frame.size.width-self.frame.size.width)/2;
}

#pragma mark 将UIView在指定parentView里水平居中
- (void)setUIViewCenterOf:(UIView *)parentView{
    if (parentView != nil) {
        CGRect newCGRect = self.frame;
        newCGRect.origin.x = (parentView.frame.size.width - self.frame.size.width)/2.0f;
        self.frame = newCGRect;
    }
}

#pragma mark 将UIView在指定parentView里垂直居中
- (void)setUIViewMiddleOf:(UIView *)parentView{
    if (parentView != nil) {
        CGRect newCGRect = self.frame;
        newCGRect.origin.y = (parentView.frame.size.height - self.frame.size.height)/2.0f;
        self.frame = newCGRect;
    }
}

#pragma mark 将UIView在指定parentView里垂直并水平居中
- (void)setUIViewVerticalAndHorizontalCenterOf:(UIView *)parentView{
    if (parentView != nil) {
        CGRect newCGRect = self.frame;
        newCGRect.origin.y = (parentView.frame.size.height - self.frame.size.height)/2.0f;
        newCGRect.origin.x = (parentView.frame.size.width - self.frame.size.width)/2.0f;
        self.frame = newCGRect;
    }
}

#pragma mark 计算实例view到指定的superView的Y值
- (CGFloat)offsetyFromSuperView:(UIView *)superView{
    int i = 0;
    CGFloat offsetY = self.frame.origin.y;
    UIView *nextSuperView = self.superview;
    
    while (nextSuperView && nextSuperView != superView && i<20) {
        offsetY += nextSuperView.frame.origin.y;
        nextSuperView = nextSuperView.superview;
        i++;
    }
    return offsetY;
}

#pragma mark 设置UIVIiew的border
- (void)setBorderWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    CALayer *layer = self.layer;
    
    if ((top == right == bottom == left) && top>0) {
        CALayer *border = [CALayer layer];
        border.borderWidth = top;
        [border setBorderColor:self.layer.borderColor];
        [layer addSublayer:border];
        return;
    }
    
    if (top>0) {
        CALayer *topBorder = [CALayer layer];
        topBorder.borderWidth = top;
        topBorder.frame = CGRectMake(0, 0, layer.frame.size.width, top);
        [topBorder setBorderColor:self.layer.borderColor];
        [layer addSublayer:topBorder];
    }
    
    if (right>0) {
        CALayer *rightBorder = [CALayer layer];
        rightBorder.borderWidth = right;
        rightBorder.frame = CGRectMake(layer.frame.size.width-right, 0, right, layer.frame.size.height);
        [rightBorder setBorderColor:self.layer.borderColor];
        [layer addSublayer:rightBorder];
    }
    
    if (bottom>0) {
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.borderWidth = bottom;
        bottomBorder.frame = CGRectMake(0, layer.frame.size.height-bottom, layer.frame.size.width, bottom);
        [bottomBorder setBorderColor:self.layer.borderColor];
        [layer addSublayer:bottomBorder];
    }
    
    if (left>0) {
        CALayer *leftBorder = [CALayer layer];
        leftBorder.borderWidth = left;
        leftBorder.frame = CGRectMake(0, 0, left, layer.frame.size.height);
        [leftBorder setBorderColor:self.layer.borderColor];
        [layer addSublayer:leftBorder];
    }
    
}

#pragma mark 弹出view,类似于弹簧效果
- (void)showAnimationWithSpring
{
    self.hidden=NO;
    CGAffineTransform newTransform =
    CGAffineTransformScale(self.transform, 0.1, 0.1);
    [self setTransform:newTransform];
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(self.transform, 11, 11);
        [self setTransform:newTransform];
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self setTransform:CGAffineTransformIdentity];
            
            
        }completion:^(BOOL finished){
            
            
        }];
        
    }];
}

#pragma mark 关闭view,类似于弹簧效果
- (void)hiddenAnimationWithSpring
{
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(self.transform, 1.1, 1.1);
        [self setTransform:newTransform];
        
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            CGAffineTransform newTransform =
            CGAffineTransformScale(self.transform, 0.1, 0.1);
            [self setTransform:newTransform];
            self.alpha=0;
            
        }completion:^(BOOL finished){
            [self setTransform:CGAffineTransformIdentity];
            self.hidden=YES;
            self.alpha=1;
        }];
        
    }];
}
-(UIImage*)captureViewframe:(CGRect)fra{
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef ref = CGImageCreateWithImageInRect(img.CGImage, fra);
    UIImage *i = [UIImage imageWithCGImage:ref];
    CGImageRelease(ref);
    return i;
}
-(void)roundCount:(CGSize )size diretionNum:(UIRectCorner)corner{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:corner
                                                     cornerRadii:size];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    
}
- (UIImage *) screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
