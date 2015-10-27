//
//  UIViewController+DLExtension.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "UIViewController+DLExtension.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation UIViewController (DLExtension)

#pragma mark -
#pragma mark manage ToolBar

- (void)showToolbar:(BOOL)animated {
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? viewSize.height : viewSize.width;
    CGFloat toolbarHeight = self.navigationController.toolbar.frame.size.height;
    [self setToolbarOriginY:viewHeight - toolbarHeight animated:animated];
}

- (void)hideToolbar:(BOOL)animated {
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? viewSize.height : viewSize.width;
    [self setToolbarOriginY:viewHeight animated:animated];
}

- (void)moveToolbar:(CGFloat)deltaY animated:(BOOL)animated {
    CGRect frame = self.navigationController.toolbar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self setToolbarOriginY:nextY animated:animated];
}

- (void)setToolbarOriginY:(CGFloat)y animated:(BOOL)animated {
    CGRect frame = self.navigationController.toolbar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? 0.1 : 0 animations:^{
        self.navigationController.toolbar.frame = frame;
    }];
}

#pragma mark -
#pragma mark manage TabBar

- (void)showTabBar:(BOOL)animated {
    CGFloat viewHeight = self.tabBarController.view.frame.size.height;
    CGFloat toolbarHeight = self.tabBarController.tabBar.frame.size.height;
    [self setToolbarOriginY:viewHeight - toolbarHeight animated:animated];
}

- (void)hideTabBar:(BOOL)animated {
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? viewSize.height : viewSize.width;
    [self setToolbarOriginY:viewHeight animated:animated];
}

- (void)moveTabBar:(CGFloat)deltaY animated:(BOOL)animated {
    CGRect frame =  self.tabBarController.tabBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self setToolbarOriginY:nextY animated:animated];
}

- (void)setTabBarOriginY:(CGFloat)y animated:(BOOL)animated {
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? 0.1 : 0 animations:^{
        self.tabBarController.tabBar.frame = frame;
    }];
}

-(void)setLeftBarItem:(UIView*) view {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = left;
}

-(void)setRightBarItem:(UIView*) view {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)setTitleView:(UIView*)view {
    self.navigationItem.titleView = view;
}

-(void)setBackButton {
    UIImage* buttImg = [UIImage imageNamed:@"btn_pb_back_s"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5.0f, (44.0 - buttImg.size.height) / 2, buttImg.size.width, buttImg.size.height);
    [backButton addTarget:self action:@selector(popNavigationControllerWithAnimate) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:buttImg forState:UIControlStateNormal];
    UIImage *returnHighlightedImage = [UIImage imageNamed:@"btn_pb_back_s"];
    [backButton setBackgroundImage:returnHighlightedImage forState:UIControlStateHighlighted];
    
    [self setLeftBarItem:backButton];
}

- (void)setBackButtonNotPressedStyle {
    [self setBackButtonNotPressedStyle:NULL];
}

- (void)setBackButtonNotPressedStyle:(SEL)selecor {
    SEL targetSel = selecor;
    if(!selecor)
    {
        targetSel = @selector(popNavigationControllerWithAnimate);
    }
    UIImage* buttImg = [UIImage imageNamed:@"btn_pb_back_s"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5.0f, (44.0 - buttImg.size.height) / 2, buttImg.size.width, buttImg.size.height);
    [backButton addTarget:self action:targetSel forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:buttImg forState:UIControlStateNormal];
    [self setLeftBarItem:backButton];
    
}

- (void)setBackToRootButtonNotPressedStyle {
    [self setBackToRootButtonNotPressedStyle:NULL];
}


- (void)setBackToRootButtonNotPressedStyle:(SEL)selecor {
    SEL targetSel = selecor;
    if(!selecor)
    {
        targetSel = @selector(popToRootNavigationControllerWithAnimate);
    }
    UIImage* buttImg = [UIImage imageNamed:@"btn_pb_back_s"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5.0f, (44.0 - buttImg.size.height) / 2, buttImg.size.width, buttImg.size.height);
    [backButton addTarget:self action:targetSel forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:buttImg forState:UIControlStateNormal];
    [self setLeftBarItem:backButton];
}

- (void)popToRootNavigationControllerWithAnimate
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popNavigationControllerWithAnimate
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(70, 7, 320 - 2 * 70, 30)];
    label.font = [UIFont boldSystemFontOfSize:18.0];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [self setTitleView:label];
}

@end
#pragma clang diagnostic pop