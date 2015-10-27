//
//  DLAnimation.h
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLAnimation : NSObject

typedef enum {
    DLAnimationTypeRotate,     // 自转动画
    DLAnimationTypeWiggle,     // 不停摇摆动画
    DLAnimationTypeShake,      // 不停摇晃动画
    DLAnimationTypeRipple,     // 涟漪动画
    DLAnimationTypeStretch,    // x轴变形动画
    DLAnimationTypeBreath,     // 呼吸动画
} DLAnimationActionType;       // 视图运动的动画类型

typedef enum {
    DLAnimationTypeFadeIn,     // 渐隐效果出现
    DLAnimationTypeBounce,     // 弹簧效果出现
    DLAnimationTypePop,        // 弹跳效果出来 （由0放大后至1）
    DLAnimationTypePopUp,       // 弹出放大效果 （由0放大后至1）
} DLAnimationAppearType;       // 视图出现的动画类型

typedef enum {
    DLAnimationTypeFadeOut,           // 渐隐效果消失
    DLAnimationTypeBounceDisappear,   // 弹簧效果消失
    DLAnimationTypePopDisappear,      // 弹跳效果消失 （放1放大后至0）
} DLAnimationDisappearType;        // 视图消失的动画类型

typedef enum {
    DLAnimationCellTypeScaleFadeIn,     // 由大及小渐入
    DLAnimationCellTypeNarrowFadeIn,    // 由宽及窄渐入
} DLAnimationCellType;               // cell出现方式的动画类型


// 根据视图出现的动画类型返回相应动画
+ (CAAnimation *)animationWithActionType:(DLAnimationActionType)type;

// 根据视图出现的动画类型返回相应动画
+ (CAAnimation *)animationWithAppearType:(DLAnimationAppearType)type;

// 根据视图出现的动画类型返回相应动画
+ (CAAnimation *)animationWithDisappearType:(DLAnimationDisappearType)type;

// 根据视图出现的动画类型返回相应动画
+ (CAAnimation *)animationWithCellType:(DLAnimationCellType)type;


+ (CAAnimation *)fadeInWithDuration:(NSTimeInterval)duration;
+ (CAAnimation *)fadeOutWithDuration:(NSTimeInterval)duration;
+ (CAAnimation *)rotateWithDuration:(NSTimeInterval)duration;
+ (CAAnimation *)wiggleWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;
+ (CAAnimation *)shakeWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;
+ (CAAnimation *)rippleWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;
+ (CAAnimation *)stretchWithDuration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;
+ (CAAnimation *)popWithDuration:(NSTimeInterval)duration;
+ (CAAnimation *)popDisappearWithDuration:(NSTimeInterval)duration;

@end
