//
//  UIView+DLExtension.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "UIView+DLExtension.h"
#import <objc/runtime.h>
#import "CAAnimation+WAnimation.h"

static char badgeLabelKey;
static char badgeBgColorKey;
static char badgeTextColorKey;
static char badgeAniTypeKey;
static char badgeFrameJey;

#define kBadgeBreatheAniKey     @"breathe"
#define kBadgeRotateAniKey      @"rotate"
#define kBadgeShakeAniKey       @"shake"
#define kBadgeScaleAniKey       @"scale"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#define kAnimationDidStopNotification              @"kAnimationDidStopNotification"

#define kAnimationDidStartNotification              @"kAnimationDidStartNotification"

NSString *const kDLAnimationFlyOut = @"kDLAnimationFlyOut";
NSString *const kDLAnimationTypeOut = @"kDLAnimationTypeOut";
NSString *const kDLAnimationTargetViewKey = @"kDLAnimationTargetViewKey";
NSString *const kDLAnimationCallerDelegateKey = @"kDLAnimationCallerDelegateKey";
NSString *const kDLAnimationCallerStartSelectorKey = @"kDLAnimationCallerStartSelectorKey";
NSString *const kDLAnimationCallerStopSelectorKey = @"kDLAnimationCallerStopSelectorKey";
NSString *const kDLAnimationName = @"kDLAnimationName";
NSString *const kDLAnimationType = @"kDLAnimationType";

@implementation UIView (DLExtension)

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)top {
    return self.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left {
    return self.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right {
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.top + self.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x {
    return self.center.x;
}

- (void)setX:(CGFloat)x {
    self.center = CGPointMake(x, self.center.y);
}

- (CGFloat)y {
    return self.center.y;
}

- (void)setY:(CGFloat)y {
    self.center = CGPointMake(self.center.x, y);
}

- (CGSize)boundsSize {
    return self.bounds.size;
}

- (void)setBoundsSize:(CGSize)size {
    CGRect bounds = self.bounds;
    bounds.size = size;
    self.bounds = bounds;
}

- (CGFloat)boundsWidth {
    return self.boundsSize.width;
}

- (void)setBoundsWidth:(CGFloat)width {
    CGRect bounds = self.bounds;
    bounds.size.width = width;
    self.bounds = bounds;
}

- (CGFloat)boundsHeight {
    return self.boundsSize.height;
}

- (void)setBoundsHeight:(CGFloat)height {
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}

- (CGRect)contentBounds {
    return CGRectMake(0.0f, 0.0f, self.boundsWidth, self.boundsHeight);
}

- (CGPoint)contentCenter {
    return CGPointMake(self.boundsWidth/2.0f, self.boundsHeight/2.0f);
}

// Animations
- (void)shakeView {
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    shake.autoreverses = YES;
    shake.repeatCount = 2.0f;
    shake.duration = 0.07f;
    
    [self.layer addAnimation:shake forKey:nil];
}

- (void)shoDLBadge{
    
    [self shoDLBadgeWithStyle:DLBadgeStyleRedDot value:0 animationType:DLBadgeAnimTypeNone];
}

/**
 *  shoDLBadge
 *
 *  @param style DLBadgeStyle type
 *  @param value (if 'style' is DLBadgeStyleRedDot or DLBadgeStyleNew,
 *                this value will be ignored. In this case, any value will be ok.)
 */
- (void)shoDLBadgeWithStyle:(DLBadgeStyle)style value:(NSInteger)value animationType:(DLBadgeAnimType)aniType {
    
    self.aniType = aniType;
    switch (style) {
        case DLBadgeStyleRedDot:
            [self showRedDotBadge];
            break;
        case DLBadgeStyleNumber:
            [self showNumberBadgeWithValue:value];
            break;
        case DLBadgeStyleNew:
            [self showNeDLBadge];
            break;
        default:
            break;
    }
    if (aniType != DLBadgeAnimTypeNone) {
        [self beginAnimation];
    }
}

/**
 *  clear badge
 */
- (void)clearBadge {
    
    self.badge.hidden = YES;
}

#pragma mark -- private methods
- (void)showRedDotBadge {
    
    [self badgeInit];
    //if badge has been displayed and, in addition, is was not red dot style, we must update UI.
    if (self.badge.tag != DLBadgeStyleRedDot) {
        self.badge.text = @"";
        self.badge.tag = DLBadgeStyleRedDot;
        self.badge.layer.cornerRadius = self.badge.width / 2;
    }
    self.badge.hidden = NO;
}

- (void)showNeDLBadge {
    
    [self badgeInit];
    //if badge has been displayed and, in addition, is was not red dot style, we must update UI.
    if (self.badge.tag != DLBadgeStyleNew) {
        self.badge.text = @"new";
        self.badge.tag = DLBadgeStyleNew;
        self.badge.width = 20;
        self.badge.height = 13;
        self.badge.center = CGPointMake(self.width, 0);
        self.badge.font = [UIFont boldSystemFontOfSize:9];
        self.badge.layer.cornerRadius = self.badge.height / 3;
    }
    self.badge.hidden = NO;
}

- (void)showNumberBadgeWithValue:(NSInteger)value {
    
    if (value < 0) {
        return;
    }
    [self badgeInit];
    if (self.badge.tag != DLBadgeStyleNumber) {
        self.badge.tag = DLBadgeStyleNumber;
        
        //maximun value allowed is 99. When the value is greater than 99, "99+" will be shown.
        if (value >=100) {
            self.badge.text = @"99+";
        } else {
            self.badge.text = [NSString stringWithFormat:@"%@", @(value)];
        }
        [self adjustLabelWidth:self.badge];
        self.badge.width = self.badge.width - 4;
        self.badge.height = 12;
        if (self.badge.width < self.badge.height) {
            self.badge.width = self.badge.height;
        }
        
        self.badge.center = CGPointMake(self.width, 0);
        self.badge.font = [UIFont boldSystemFontOfSize:9];
        self.badge.layer.cornerRadius = self.badge.height / 2;
    }
    self.badge.hidden = NO;
}

//lazy loading
- (void)badgeInit {
    
    if (self.badgeBgColor == nil) {
        self.badgeBgColor = [UIColor redColor];
    }
    if (self.badgeTextColor == nil) {
        self.badgeTextColor = [UIColor whiteColor];
    }
    if (nil == self.badge) {
        CGFloat redotWidth = 8;
        CGRect frm = CGRectMake(self.width, -redotWidth, redotWidth, redotWidth);
        self.badge = [[UILabel alloc] initWithFrame:frm];
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.center = CGPointMake(self.width, 0);
        self.badge.backgroundColor = self.badgeBgColor;
        self.badge.textColor = self.badgeTextColor;
        self.badge.text = @"";
        self.badge.tag = DLBadgeStyleRedDot;//red dot by default
        self.badge.layer.cornerRadius = self.badge.width / 2;
        self.badge.layer.masksToBounds = YES;//very important
        [self addSubview:self.badge];
    }
}

#pragma mark --  other private methods
- (void)adjustLabelWidth:(UILabel *)label {
    
    [label setNumberOfLines:0];
    NSString *s = label.text;
    UIFont *font = [UIFont fontWithName:@"Arial" size:label.font.pointSize];
    CGSize size = CGSizeMake(320,2000);
    CGSize labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frame = label.frame;
    frame.size = labelsize;
    [label setFrame:frame];
}

#pragma mark -- animation

//if u want to add badge animation type, follow steps bellow:
//1. go to definition of DLBadgeAnimType and add new type
//2. go to category of CAAnimation+WAnimation to add new animation interface
//3. call that new interface here
- (void)beginAnimation {
    
    if (self.aniType == DLBadgeAnimTypeBreathe)
    {
        [self.badge.layer addAnimation:[CAAnimation opacityForever_Animation:1.4]
                                forKey:kBadgeBreatheAniKey];
    }
    else if (self.aniType == DLBadgeAnimTypeShake)
    {
        [self.badge.layer addAnimation:[CAAnimation shake_AnimationRepeatTimes:MAXFLOAT
                                                                      durTimes:1
                                                                        forObj:self.badge.layer]
                                forKey:kBadgeShakeAniKey];
    }
    else if (self.aniType == DLBadgeAnimTypeScale)
    {
        [self.badge.layer addAnimation:[CAAnimation scaleFrom:1.4
                                                      toScale:0.6
                                                     durTimes:1
                                                          rep:MAXFLOAT]
                                forKey:kBadgeScaleAniKey];
    }
}


#pragma mark -- setter/getter
- (UILabel *)badge {
    
    return objc_getAssociatedObject(self, &badgeLabelKey);
}

- (void)setBadge:(UILabel *)label {
    
    objc_setAssociatedObject(self, &badgeLabelKey, label, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)badgeBgColor {
    
    return objc_getAssociatedObject(self, &badgeBgColorKey);
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor {
    
    objc_setAssociatedObject(self, &badgeBgColorKey, badgeBgColor, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)badgeTextColor {
    
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN);
}

- (DLBadgeAnimType)aniType {
    
    id obj = objc_getAssociatedObject(self, &badgeAniTypeKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return DLBadgeAnimTypeNone;
}

- (void)setAniType:(DLBadgeAnimType)aniType {
    
    NSNumber *numObj = @(aniType);
    objc_setAssociatedObject(self, &badgeAniTypeKey, numObj, OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)badgeFrame {
    
    id obj = objc_getAssociatedObject(self, &badgeFrameJey);
    if (obj != nil && [obj isKindOfClass:[NSArray class]] && [obj count] == 4 ) {
        CGFloat x = [obj[0] floatValue];
        CGFloat y = [obj[1] floatValue];
        CGFloat width = [obj[2] floatValue];
        CGFloat height = [obj[3] floatValue];
        return  CGRectMake(x, y, width, height);
    } else
        return CGRectZero;
}

- (void)setBadgeFrame:(CGRect)badgeFrame {
    
    
}

@end

#pragma clang diagnostic pop