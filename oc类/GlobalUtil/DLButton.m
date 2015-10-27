//
//  DLButton.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLButton.h"

@implementation DLButton

+ (UIButton *)buttonType: (UIButtonType)type frame: (CGRect)frame title: (NSString *)title titleColor: (UIColor *)color backGroundImage: (UIImage *)BGImage highLightImage: (UIImage *)highLightImage target: (id)object Selector: (SEL)sec selectorState: (UIControlEvents)buttonEvent {
    
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundImage:BGImage forState:UIControlStateNormal];
    [button setBackgroundImage:highLightImage forState:UIControlStateHighlighted];
    [button addTarget:object action:sec forControlEvents:buttonEvent];
    return button;
}

@end
