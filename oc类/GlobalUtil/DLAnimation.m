//
//  DLAnimation.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLAnimation.h"

@implementation DLAnimation

+ (CAAnimation *)animationWithAppearType:(DLAnimationAppearType)type
{
    CAAnimation *animation = nil;
    
    switch(type)
    {
        case DLAnimationTypeFadeIn:
            animation = [DLAnimation fadeInWithDuration:0.25];
            break;
        case DLAnimationTypeBounce:
            break;
        case DLAnimationTypePop:
            animation = [DLAnimation popWithDuration:0.45];
            break;
        case DLAnimationTypePopUp:
            animation = [DLAnimation popUpWithDuration:0.25];
            break;
        default:
            break;
    }
    
    return animation;
}

+ (CAAnimation *)animationWithDisappearType:(DLAnimationDisappearType)type
{
    CAAnimation *animation = nil;
    
    switch(type)
    {
        case DLAnimationTypeFadeOut:
            animation = [DLAnimation fadeInWithDuration:0.25];
            break;
        case DLAnimationTypeBounceDisappear:
            break;
        default:
            break;
    }
    
    return animation;
}

+ (CAAnimation *)animationWithActionType:(DLAnimationActionType)type
{
    CAAnimation *animation = nil;
    switch (type)
    {
        case DLAnimationTypeRotate:
            animation = [DLAnimation rotateWithDuration:0.25];
            break;
        case DLAnimationTypeWiggle:
            animation = [DLAnimation wiggleWithDuration:0.25 repeatCount:5];
            break;
        case DLAnimationTypeShake:
            animation = [DLAnimation shakeWithDuration:0.25 repeatCount:5];
            break;
        case DLAnimationTypeStretch:
            animation = [DLAnimation stretchWithDuration:0.25 repeatCount:3];
            break;
        case DLAnimationTypeRipple:
            animation = [DLAnimation rippleWithDuration:0.25 repeatCount:3];
            break;
        case DLAnimationTypeBreath:
            animation = [DLAnimation breathWithDuration:0.25 repeatCount:3];
            break;
        default:
            break;
    }
    return animation;
}

+ (CAAnimation *)animationWithCellType:(DLAnimationCellType)type
{
    CAAnimation *animation = nil;
    
    switch (type)
    {
        case DLAnimationCellTypeScaleFadeIn:
            animation = [DLAnimation cellScaleAndFadeIn:0.25];
            break;
        case DLAnimationCellTypeNarrowFadeIn:
            animation = [DLAnimation cellNarrowAndFadeIn:0.25];
            break;
        default:
            break;
    }
    
    return animation;
}

#pragma mark - Appear Animation

+ (CAAnimation *)fadeInWithDuration:(NSTimeInterval)duration
{
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = [NSNumber numberWithFloat:0.0];
    fadeIn.toValue = [NSNumber numberWithFloat:1.0];
    fadeIn.duration = duration;
    return fadeIn;
}

#pragma mark - Disappear Animation

+ (CAAnimation *)fadeOutWithDuration:(NSTimeInterval)duration
{
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = [NSNumber numberWithFloat:1.0];
    fadeIn.toValue = [NSNumber numberWithFloat:0.0];
    fadeIn.duration = duration;
    return fadeIn;
}

#pragma mark - Action Animation

+ (CAAnimation *)rotateWithDuration:(NSTimeInterval)duration
{
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = @(0);
    rotate.toValue = @(M_PI * 2);
    rotate.duration = duration;
    rotate.repeatCount = HUGE_VAL;
    return rotate;
}

+ (CAAnimation *)wiggleWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    CABasicAnimation *wiggle = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    wiggle.fromValue = @(M_PI / 8);
    wiggle.toValue = @(-M_PI / 8);
    wiggle.duration = duration;
    wiggle.repeatCount = count;
    return wiggle;
}

#pragma mark - Shake Animation

+ (CAAnimation *)shakeWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    return [DLAnimation stretchWithDuration:0.25 fromValue:-10 toValue:10 repeatCount:count];
}

+ (CAAnimation *)shakeWithDuration:(NSTimeInterval)duration fromValue:(float)fromValue toValue:(float)toValue repeatCount:(NSUInteger)count
{
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.fromValue = @(fromValue);
    shake.toValue = @(toValue);
    shake.repeatCount = count;
    shake.duration = duration;
    return shake;
}

#pragma mark - Ripple

+ (CAAnimation *)rippleWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = UIViewAnimationCurveEaseInOut;
    transition.type = @"rippleEffect";
    return transition;
}

#pragma mark - Stretch Animation

+ (CAAnimation *)stretchWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    return [DLAnimation stretchWithDuration:duration fromValue:1.0 toValue:1.08 repeatCount:count];
}

+ (CAAnimation *)stretchWithDuration:(NSTimeInterval)duration fromValue:(float)fromValue toValue:(float)toValue repeatCount:(NSUInteger)count
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = count;
    animation.duration = duration;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}

#pragma mark - Breath Animation

+ (CAAnimation *)breathWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    CABasicAnimation *breath = [CABasicAnimation animationWithKeyPath:@"opacity"];
    breath.fromValue = [NSNumber numberWithFloat:1.0];
    breath.toValue = [NSNumber numberWithFloat:0.0];
    breath.duration = duration;
    breath.repeatCount = count;
    breath.autoreverses = YES;
    return breath;
}

#pragma mark - Cell Animation

+ (CAAnimation *)cellScaleAndFadeIn:(NSTimeInterval)duration
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.duration = duration;
    scale.fromValue = @(1.08);
    scale.toValue = @(1);
    scale.fillMode = kCAFillModeForwards;
    scale.removedOnCompletion = NO;
    
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.duration = duration;
    fadeIn.fromValue = @(0);
    fadeIn.toValue = @(1);
    fadeIn.fillMode = kCAFillModeForwards;
    fadeIn.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scale, fadeIn];
    group.duration = duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return group;
}

+ (CAAnimation *)cellNarrowAndFadeIn:(NSTimeInterval)duration
{
    CABasicAnimation *narrow = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    narrow.duration = duration;
    narrow.fromValue = @(1.08);
    narrow.toValue = @(1.0);
    narrow.fillMode = kCAFillModeForwards;
    narrow.removedOnCompletion = NO;
    
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.duration = duration;
    fadeIn.fromValue = @(0);
    fadeIn.toValue = @(1);
    fadeIn.fillMode = kCAFillModeForwards;
    fadeIn.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[narrow, fadeIn];
    group.duration = duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return group;
}

+ (CAAnimation *)popWithDuration:(NSTimeInterval)duration
{
    NSTimeInterval zoomInDuration = duration * 0.5;
    NSTimeInterval zoomOutDuration = duration * 0.5;
    
    CABasicAnimation *zoomIn = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomIn.duration = zoomInDuration;
    zoomIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    zoomIn.fromValue = @(0);
    zoomIn.toValue = @(1.35);
    zoomIn.fillMode = kCAFillModeForwards;
    zoomIn.removedOnCompletion = NO;
    
    CABasicAnimation *zoomOut = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOut.beginTime = zoomInDuration;
    zoomOut.duration = zoomOutDuration;
    zoomOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zoomOut.fromValue = @(1.35);
    zoomOut.toValue = @(1.0);
    zoomOut.fillMode = kCAFillModeForwards;
    zoomOut.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[zoomIn, zoomOut];
    group.duration = duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return  group;
}

+ (CAAnimation *)popUpWithDuration:(NSTimeInterval)duration
{
    CABasicAnimation *zoomIn = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomIn.duration = duration;
    zoomIn.fromValue = @(0.1);
    zoomIn.toValue = @(1.0);
    zoomIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    zoomIn.fillMode = kCAFillModeForwards;
    zoomIn.removedOnCompletion = NO;
    
    return zoomIn;
}

+ (CAAnimation *)popDisappearWithDuration:(NSTimeInterval)duration
{
    NSTimeInterval zoomInDuration = duration * 0.5;
    NSTimeInterval zoomOutDuration = duration * 0.5;
    
    CABasicAnimation *zoomIn = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomIn.duration = zoomInDuration;
    zoomIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zoomIn.fromValue = @(1);
    zoomIn.toValue = @(1.35);
    zoomIn.fillMode = kCAFillModeForwards;
    zoomIn.removedOnCompletion = NO;
    
    CABasicAnimation *zoomOut = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOut.beginTime = zoomInDuration;
    zoomOut.duration = zoomOutDuration;
    zoomOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    zoomOut.fromValue = @(1.35);
    zoomOut.toValue = @(0.0);
    zoomOut.fillMode = kCAFillModeForwards;
    zoomOut.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[zoomIn, zoomOut];
    group.duration = duration;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return  group;
}

@end
