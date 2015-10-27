//
//  ZWDImageUploadDemo.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDImageUploadDemo.h"
#import "ZWDImageUpload.h"
@implementation ZWDImageUploadDemo
-(void)test{
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:@""]];
    ZWDImageUpload *upload = [ZWDImageUpload new];
    UIImage *image1 = [UIImage imageNamed:@""];
    UIImage *image2 = [UIImage imageNamed:@""];
    UIImage *image3 = [UIImage imageNamed:@""];
    upload.boundary = @"";
    upload.parameters = @{};
    upload.pictures = @[createPNGPicture(@"", image1, @"image1",@"1.png"),createPNGPicture(@"", image1, @"image1",@"1.png"),createPNGPicture(@"", image2, @"image2",@"2.png"),createPNGPicture(@"", image3, @"image3",@"3.png")];
    [upload configRequest:&requst];
  
}
@end
