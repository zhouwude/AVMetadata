//
//  UIView+syCategory.h
//  syUtil
//
//  Created by 世缘 on 15/2/3.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (syCategory)
typedef enum {
    ZWDDirectionLeftTop,   //
    ZWDDirectionRightTop ,   //
    ZWDDirectionLeftBottom,
    ZWDDirectionRightBottom
} ZWDDirection;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

/**
 *  创建view
 *
 *  @return 新view
 */
+(id)create;

/**
 *  计算一个UIView的 endX = x坐标 + width + 格外加上的extraX
 *
 *  @param extraX  格外加上的宽度
 *
 *  @return endX
 */
- (CGFloat)getEndXwith:(CGFloat)extraX;

/**
 *  计算一个UIView的 endY = y坐标 + height + 格外加上的extraY
 *
 *  @param extraY 格外加上的高度
 *
 *  @return endY
 */
- (CGFloat)getEndYwith:(CGFloat)extraY;

/**
 *  设置所有子view垂直居中
 */
- (void)setSubViewsMiddle;

/**
 *  设置所有子view水平居中
 */
- (void)setSubViewsCenter;

/**
 *  让UIView在父View垂直居中，注意：调用此方法前确保当前view已加入父view中
 */
- (void)setUIViewMiddle;

/**
 *  让UIView在父View中水平居中，注意：调用此方法前确保当前view已加入父view中
 */
- (void)setUIViewCenter;

/**
 *  将UIView在指定parentView里水平居中
 *
 *  @param parentView 父UIView
 */
- (void)setUIViewCenterOf:(UIView *)parentView;

/**
 *  将UIView在指定parentView里垂直居中
 *
 *  @param parentView 父UIView
 */
- (void)setUIViewMiddleOf:(UIView *)parentView;

/**
 *  将UIView在指定parentView里垂直并水平居中
 *
 *  @param parentView 父UIView
 */
- (void)setUIViewVerticalAndHorizontalCenterOf:(UIView *)parentView;

/**
 *  计算实例view到指定的SuperView的Y值,
 *  ____superView最顶层也就是viewController.view,即此时值可设置为nil,
 *  ____(注意：距离最顶层，ios6与7会相差20像素);
 *
 *  @param superView 指定的SuperView
 *
 *  @return 目标view在指定superView的Y值距离
 */
- (CGFloat)offsetyFromSuperView:(UIView *)superView;

/**
 *  设置UIVIiew的border
 *
 *  @param top    上
 *  @param right  右
 *  @param bottom 下
 *  @param left   左
 */
- (void)setBorderWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

/**
 *  弹出view,类似于弹簧效果
 */
- (void)showAnimationWithSpring;

/**
 *  关闭view,类似于弹簧效果
 */
- (void)hiddenAnimationWithSpring;
// 取指定的图片 在view中
-(UIImage*)captureViewframe:(CGRect)fra;
//获得圆角的个数
-(void)roundCount:(CGSize )size diretionNum:(UIRectCorner)corner;
//截屏返回image
- (UIImage *)screenshot;
@end
