//
//  ZWDXYMath.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//
/**
 
 ---- 常用数学公式 ----

//指数运算 3^2 3^3
NSLog(@"结果 %.f", pow(3,2));              //result 9
NSLog(@"结果 %.f", pow(3,3));              //result 27

//开平方运算
NSLog(@"结果 %.f", sqrt(16));              //result 4
NSLog(@"结果 %.f", sqrt(81));              //result 9

//进一
NSLog(@"结果 %.f", ceil(3.000000000001));  //result 4
NSLog(@"结果 %.f", ceil(3.00));            //result 3

//退一
NSLog(@"结果 %.f", floor(3.000000000001)); //result 3
NSLog(@"结果 %.f", floor(3.9999999));      //result 3

//四舍五入
NSLog(@"结果 %.f", round(3.5));            //result 4
NSLog(@"结果 %.f", round(3.46));           //result 3
NSLog(@"结果 %.f", round(-3.5));           //NB: this one returns -4

//最小值
NSLog(@"结果 %.f", fmin(5,10));            //result 5

//最大值
NSLog(@"结果 %.f", fmax(5,10));            //result 10

//绝对值
NSLog(@"结果 %.f", fabs(10));              //result 10
NSLog(@"结果 %.f", fabs(-10));             //result 10
 */
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
