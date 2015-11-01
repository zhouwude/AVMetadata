//
//  ZWDWebview.m
//  ZWDdemo
//
//  Created by 周武德 on 15/11/1.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDWebview.h"

@implementation ZWDWebview
-(void)test{
    //最终我是监听了 webView的 contentSize，每当contentSize的值改变时就去更改webView 的frame。
    [_webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    
    
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
   // 然后在回调方法里改变webView的frame
    if ([keyPath isEqualToString:@"contentSize"]) {
      float  webViewHeight = [[_webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
        CGRect newFrame       = _webView.frame;
        newFrame.size.height  = webViewHeight;
        _webView.frame = newFrame;
        [_mainTableView setTableHeaderView:_webView];
    }
}
-(void)dealloc{
    
    [_webView.scrollView removeObserver:self
                                    forKeyPath:@"contentSize" context:nil];
    
    
}
@end
