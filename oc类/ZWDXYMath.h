//
//  ZWDXYMath.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface ZWDXYMath : NSObject
/*---- 计算一元一次方程 ----
 
 y = kX + b
 
 ------------------------*/
@property (nonatomic, assign, readonly) CGFloat  k;
@property (nonatomic, assign, readonly) CGFloat  b;
- (instancetype)initWithLinearFunctionPointA:(CGPoint)pointA
                                      pointB:(CGPoint)pointB;


/*---- 计算一元二次方程普通式 ----
 
 y = aX^2 + bX + c
 
 ----------------------------*/
@property (nonatomic, assign, readonly) CGFloat  A;
@property (nonatomic, assign, readonly) CGFloat  B;
@property (nonatomic, assign, readonly) CGFloat  C;
- (instancetype)initWithQuadraticFunctionPointA:(CGPoint)pointA
                                         pointB:(CGPoint)pointB
                                         pointC:(CGPoint)pointC;

/*---- 计算一元二次方程顶点式 ----
 
 y = a(X - h)^2 + k
 注意:顶点为(h, k)
 
 ----------------------------*/
@property (nonatomic, assign, readonly) CGFloat  a;
- (instancetype)initWithQuadraticFunctionPointApex:(CGPoint)apex
                                             point:(CGPoint)point;


@end
