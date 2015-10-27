//
//  DLLabel.m
//  DLKit
//
//  Created by XueYulun on 15/3/25.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLLabel.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation DLLabel

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
}

- (id)init {
    self = [super init];
    
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (id)initWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color {
    return [self initWithText:text font:font textColor:color backgroundColor:[UIColor clearColor]];
}

- (id)initWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    self = [super init];
    if (self)
    {
        self.textColor = color;
        self.backgroundColor = backgroundColor;
        
        [self setText:text font:font];
    }
    return self;
}

- (void)setText:(NSString *)text font:(UIFont *)font {
    self.text = text;
    self.font = font;
    CGSize size = [text sizeWithFont:font];
    self.frame = CGRectMake(0, 0, size.width, size.height);
    [self sizeToFit];
}

@end
#pragma clang diagnostic pop