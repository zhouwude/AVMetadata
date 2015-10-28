//
//  ZWDTimerTest.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/28.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDTimerTest.h"
@interface ZWDTimerTest()<ZWDTimerDelegete>
@property (nonatomic, strong) ZWDTimer   *timer;
@property (nonatomic, strong) UILabel   *label;
@property (nonatomic, strong) NSArray   *dataArray;
@property (nonatomic)         NSInteger  count;
@end
@implementation ZWDTimerTest
-(void)viewDidLoad{
    [super viewDidLoad];
    //支持代理和block
//    [ZWDTimer timerWithMilliSecondInterval:100 Block:^(ZWDTimer *timer) {
//        
//    }];
    _dataArray = @[@"Y.X. Loading .",
                   @"Y.X. Loading ..",
                   @"Y.X. Loading ...",
                   @"Y.X. Loading ....",
                   @"Y.X. Loading .....",
                   @"Y.X. Loading ......",
                   @"Y.X. Loading ......."];
    
    _timer             = [ZWDTimer new];
    _timer.milliSecond = 100;
    _timer.delegate    = self;
    [_timer start];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.f];
    _label.textColor = [UIColor redColor];
    _label.center = self.view.center;
    [self.view addSubview:_label];
    
}
- (void)ZWDTimerEvent:(ZWDTimer *)timer
{
    _label.text = _dataArray[_count++ % _dataArray.count];
}
@end
