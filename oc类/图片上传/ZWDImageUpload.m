//
//  ZWDImageUpload.m
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDImageUpload.h"

@implementation ZWDImageUpload
#pragma mark - 创建图片POST头部信息
- (NSData *)createParametersData
{
    // 生成了头部信息
    NSString        *start = [NSString stringWithFormat:@"--%@", _boundary];
    NSMutableString *body  = [[NSMutableString alloc] init];
    NSArray         *keys  = [_parameters allKeys];
    
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *key = keys[idx];
        
        [body appendFormat:@"\r\n%@\r\n", start];
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key];
        [body appendFormat:@"%@",_parameters[key]];
    }];
    
    return [body dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - 创建图片POST尾部信息
- (NSData *)createEndData
{
    NSString *end = [NSString stringWithFormat:@"\r\n--%@--\r\n", _boundary];
    return [end dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - 生成POST需要的数据格式
- (NSData *)createPostData
{
    if (_boundary && _parameters)
    {
        NSMutableData *postData = [NSMutableData data];
        
        // 添加头
        [postData appendData:[self createParametersData]];
        
        // 添加图片
        [_pictures enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[NSData class]])
            {
                [postData appendData:obj];
            }
        }];
        
        // 添加尾
        [postData appendData:[self createEndData]];
        
        return postData;
    }
    else
    {
        return nil;
    }
}

#pragma mark - 创建PNG格式的图片
NSData * createPNGPicture(NSString *formBoundary, UIImage *image,
                          NSString *name,         NSString *filename)
{
    NSString *start = [NSString stringWithFormat:@"--%@", formBoundary];
    
    // 添加分界线，换行
    NSMutableString *subBody = [[NSMutableString alloc] init];
    [subBody appendFormat:@"\r\n%@\r\n", start];
    [subBody appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",
     name, filename];
    
    // 声明上传文件的格式
    [subBody appendFormat:@"Content-Type: image/png\r\n\r\n"];
    
    // 图片data
    NSData *imageData = UIImagePNGRepresentation(image);
    
    // 生成图片data
    NSMutableData *tmpData = [NSMutableData data];
    [tmpData appendData:[subBody dataUsingEncoding:NSUTF8StringEncoding]];
    [tmpData appendData:imageData];
    
    return [NSData dataWithData:tmpData];
}

- (void)configRequest:(NSMutableURLRequest **)request
{
    // 获取到了POST包体
    NSData *data = [self createPostData];
    
    // 配置请求
    NSMutableURLRequest *tmpRequest = *request;
    
    // 设置请求POST包体
    tmpRequest.HTTPBody    = data;
    tmpRequest.HTTPMethod  = @"POST";
    
    // 设置HTTPHeaderField
    [tmpRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]]
      forHTTPHeaderField:@"Content-Length"];
    [tmpRequest setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", _boundary]
      forHTTPHeaderField:@"Content-Type"];
}

@end
