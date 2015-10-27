//
//  ZWDDemo.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDDemo.h"

@implementation ZWDDemo
-(void)test{
    // 开始检测 放在 launch里面
    [ZWDObjectDetector startWatch];
    /*
     |
     |
     |
     |
     |
     */
    //增加  检测对象
    [ZWDObjectDetector addToWatch:self];
    
    
}
@end
