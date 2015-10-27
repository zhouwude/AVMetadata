//
//  ZWDXYMath.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDXYMath.h"

@implementation ZWDXYMath
- (instancetype)initWithQuadraticFunctionPointA:(CGPoint)pointA
                                         pointB:(CGPoint)pointB
                                         pointC:(CGPoint)pointC
{
    self = [super init];
    if (self)
    {
        CGFloat x1 = pointA.x; CGFloat y1 = pointA.y;
        CGFloat x2 = pointB.x; CGFloat y2 = pointB.y;
        CGFloat x3 = pointC.x; CGFloat y3 = pointC.y;
        
        _A = calculateA(x1, y1, x2, y2, x3, y3);
        _B = calculateB(x1, y1, x2, y2, x3, y3);
        _C = calculateC(x1, y1, x2, y2, x3, y3);
    }
    return self;
}

- (instancetype)initWithLinearFunctionPointA:(CGPoint)pointA
                                      pointB:(CGPoint)pointB
{
    self = [super init];
    if (self)
    {
        CGFloat x1 = pointA.x; CGFloat y1 = pointA.y;
        CGFloat x2 = pointB.x; CGFloat y2 = pointB.y;
        
        _k = calculateSlope(x1, y1, x2, y2);
        _b = calculateConstant(x1, y1, x2, y2);
    }
    return self;
}

- (instancetype)initWithQuadraticFunctionPointApex:(CGPoint)apex
                                             point:(CGPoint)point
{
    self = [super init];
    if (self)
    {
        CGFloat h  = apex.x; CGFloat   k = apex.y;
        CGFloat x  = point.x; CGFloat  y = point.y;
        
        _a = (y - k)/((x - h)*(x - h));
    }
    return self;
}

#pragma mark - 计算常数a b c
CGFloat calculateA(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat x3, CGFloat y3)
{
    return ((y2 - y1)/(x2 - x1) - (y3 - y2)/(x3 - x2))/(x1 - x3);
}

CGFloat calculateB(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat x3, CGFloat y3)
{
    return (y2 - y1)/(x2 - x1) - (((y2 - y1)/(x2 - x1) - (y3 - y2)/(x3 - x2))/(x1 - x3));
}

CGFloat calculateC(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat x3, CGFloat y3)
{
    CGFloat a = calculateA(x1, y1, x2, y2, x3, y3);
    CGFloat b = calculateB(x1, y1, x2, y2, x3, y3);
    return y1 - a*x1*x1 - b*x1;
}

#pragma mark - 计算斜率 k
CGFloat calculateSlope(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return (y2 - y1) / (x2 - x1);
}

#pragma mark - 计算常数 b
CGFloat calculateConstant(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1);
}

@end
