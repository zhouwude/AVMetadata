//
//  ViewController.m
//  UIBezierPath
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//
// 将常数转换为度数
#define   DEGREES(degrees)  ((3.14159265359f * degrees)/ 180.f)
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取path 使用UIBezierPath绘制多边形
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    // 设定起始点
    [aPath moveToPoint:CGPointMake(0.0f, 0.0f)];
    
    // 添加点
    [aPath addLineToPoint:CGPointMake(100.0f, 100.0f)];
    [aPath addLineToPoint:CGPointMake(0.f, 50.f)];
    
    // 闭合path
    [aPath closePath];
    
    
    
    

    
    // 获取path
    //使用UIBezierPath绘制圆形
    UIBezierPath *bPath =
    [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) // 圆的中心
                                   radius:50.f                // 圆的半径
                               startAngle:DEGREES(0)          // 起始点
                                 endAngle:DEGREES(360)        // 结束点
                                clockwise:YES];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   // 使用UIBezierPath绘制矩形
    // 获取path
    UIBezierPath *cPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];

    //使用UIBezierPath绘制椭圆
    
    // 获取path
    UIBezierPath *dPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 70)];
    //使用UIBezierPath绘制圆角矩形
    //// 获取path
    UIBezierPath *ePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100)
                                                     cornerRadius:10.f];
    // 使用UIBezierPath绘制带部分圆角的矩形
    // 获取path
    UIBezierPath *fPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100)
                                                byRoundingCorners:UIRectCornerTopLeft
                                                      cornerRadii:CGSizeMake(100, 100)];
    
    //使用UIBezierPath绘制不规则曲线1
    // 获取path
    UIBezierPath *gPath = [UIBezierPath bezierPath];
    
    // 设定起始点
    [gPath moveToPoint:CGPointMake(0.0f, 0.0f)];
    
    // 添加一个不规则点
    [gPath addCurveToPoint:CGPointMake(100.f, 100.f)
             controlPoint1:CGPointMake(50.f, 0.f)     // 开始点
             controlPoint2:CGPointMake(0.f, 50.f)];   // 结束点
    
    // 添加一个点
    [gPath addLineToPoint:CGPointMake(0.0f, 100.f)];
    
    // 闭合path
    [gPath closePath];
    
    
    //使用UIBezierPath绘制不规则曲线2
    // 获取path
    UIBezierPath *hPath = [UIBezierPath bezierPath];
    
    // 设定起始点
    [hPath moveToPoint:CGPointMake(0.0f, 0.0f)];
    
    // 添加一个不规则点
    [hPath addQuadCurveToPoint:CGPointMake(100.f, 100.f)
                  controlPoint:CGPointMake(0.f, 90.f)];   // 控制点
    
    // 添加一个点
    [hPath addLineToPoint:CGPointMake(0.0f, 100.f)];
    
    // 闭合path
    [hPath closePath];
    
    //使用path与CAShapeLayer配合制作mask遮罩效果(path闭环里面的填充区域就是作为遮罩使用的)
    // 创建一个view
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    showView.backgroundColor = [UIColor greenColor];
    showView.layer.contents = (__bridge id)([UIImage imageNamed:@"1"].CGImage);
    
    // 创建一个椭圆的path
    UIBezierPath *iPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    // 创建一个CAShapeLayer并获取椭圆的path
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.opacity = 0.3;
    
    layer.path = iPath.CGPath;
    
    // 把这个CAShapeLayer添加为mask
    showView.layer.mask = layer;
    [self.view addSubview:showView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
