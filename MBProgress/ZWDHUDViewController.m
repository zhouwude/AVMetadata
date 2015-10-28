//
//  ZWDHUDViewController.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDHUDViewController.h"
#import "ZWDShowHUD.h"
typedef enum : NSUInteger {
    CASE_1, // 显示文本和菊花,延时3秒后消失
    CASE_2, // 仅仅显示文本,延时3秒后消失
    CASE_3, // 加载自定义view,3秒后消失
} E_CASE;
@interface ZWDHUDViewController ()<MBProgressHUDDelegate>
@property (nonatomic, assign) NSInteger  caseType;
@end
@implementation ZWDHUDViewController
- (void)showHUD
{
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    
    switch (_caseType++ % 3) {
            
            
            
        case CASE_1: {
            [ZWDShowHUD showText:@"YouXianMing"
              configParameter:^(ZWDShowHUD *config) {
                  config.margin          = 10.f;    // 边缘留白
                  config.opacity         = 0.7f;    // 设定透明度
                  config.cornerRadius    = 1.f;     // 设定圆角
                  config.textFont        = [UIFont systemFontOfSize:11.f];
              } duration:3 inView:window];
        } break;
            
            
            
        case CASE_2: {
            [ZWDShowHUD showTextOnly:@"YouXianMing"
                  configParameter:^(ZWDShowHUD *config) {
                      config.animationStyle  = ZoomOut;  // 设置动画方式
                      config.margin          = 20.f;     // 边缘留白
                      config.opacity         = 0.8f;     // 设定透明度
                      config.cornerRadius    = 0.1f;     // 设定圆角
                      config.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];  // 设置背景色
                      config.labelColor      = [[UIColor whiteColor] colorWithAlphaComponent:1.0];// 设置文本颜色
                  } duration:3 inView:window];
        } break;
            
            
            
            //        case CASE_3: {
            //            BackgroundView *backView = [[BackgroundView alloc] initInView:window];
            //            backView.startDuration = 0.25;
            //            backView.endDuration   = 0.25;
            //            [backView addToView];
            //
            //            ShowHUD *hud = [ShowHUD showCustomView:^UIView *{
            //                // 返回一个自定义view即可,hud会自动根据你返回的view调整空间
            //                MulticolorView *showView = [[MulticolorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
            //                showView.lineWidth       = 1.f;
            //                showView.sec             = 1.5f;
            //                showView.colors          = @[(id)[UIColor cyanColor].CGColor,
            //                                             (id)[UIColor yellowColor].CGColor,
            //                                             (id)[UIColor cyanColor].CGColor];
            //                [showView startAnimation];
            //                return showView;
            //            } configParameter:^(ShowHUD *config) {
            //                config.animationStyle  = Zoom;   // 设定动画方式
            //                config.margin          = 10.f;   // 边缘留白
            //                config.cornerRadius    = 2.f;    // 边缘圆角
            //                config.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
            //            } inView:window];
            //
            //            // 延迟5秒后消失
            //            [GCDQueue executeInMainQueue:^{
            //                [hud hide];
            //                [backView removeSelf];
            //            } afterDelaySecs:5];
            //        } break;
            
            
            
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _caseType = 0;
    
    UIButton *button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:button];
    [button addTarget:self
               action:@selector(buttonEvent:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonEvent:(id)sender
{
    [self showHUD];
}
@end
