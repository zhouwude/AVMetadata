//
//  ZWDImageUpload.h
//  ZWDdemo
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  在iOS中,用POST请求携带参数上传图片是非常恶心的事情,HTTPBody部分完全需要我们自己来配置,这个HTTPBody分为3个部分,头部分可以携带参数,中间部分就是我们要传输的图片文件,尾部就是结束标识了,这些设置完了还不够,你还需要配置一下HTTPHeaderField中的Content-Length以及Content-Type,恐怕一般人都会头大:).
 
 完整的HTTPBody解密出来后是下面的格式:
 --AaB03x
 Content-Disposition: form-data; name="appkey"
 
 peixunduoduo
 --AaB03x
 Content-Disposition: form-data; name="content"
 
 真心太好用了!
 --AaB03x
 Content-Disposition: form-data; name="userid"
 
 101
 --AaB03x
 Content-Disposition: form-data; name="sumscore"
 
 4
 --AaB03x
 Content-Disposition: form-data; name="courseid"
 
 642
 --AaB03x
 Content-Disposition: form-data; name="fromapp"
 
 2
 --AaB03x
 Content-Disposition: form-data; name="sign"
 
 003a0d94aff1c7728ab21eb785fbd544
 --AaB03x
 Content-Disposition: form-data; name="timestamp"
 
 1404373862
 
 
 --AaB03x
 Content-Disposition: form-data; name="image1"; filename="1.png"
 Content-Type: image/png
 
 
 <89504e47 0d0a1a0a 0000000d 49484452 000000c9 000000b9 08060000 0082e41b c4000000 1c69444f 54000000 02000000 00000000 5d000000 28000000 5d000000 5c000030 914514f9 44000030 5d494441 547801ec 7d0b7015 55ba2eea 8ce7a8e3 191d9ff8 0221ec50 35a335b7 4a92ec47 928d2373 4818e7e8 301254d4 0113f50e 09e21c08 1ec34b04 026a8023 210e11a3 189084b9 046a02c5 4b86644c 8e922a42 098c12ca 70490e82 6e2f8178 cd78bb4b 27c7f7fb 0d924e76 26c49c01 ecfdd078 fa059f2f fe098124 c4385d62 1c5f0c75 2dde0f81 e42a8384 8db86b91 b1aea53e 85401202 4908a401 78200492 0003d4d3 12d1a949 44a83850 ba00f69b ed439299 be63b7a7 db792dd1 e7310e14 b2d7fbfb ff017ed5 ee545a48 12fc0000 00004945 4e44ae42 6082>
 --AaB03x--
 */
#import <UIKit/UIKit.h>
@interface ZWDImageUpload : NSObject
// 创建pictures数组需要的数据
NSData * createPNGPicture(NSString *formBoundary, UIImage *image,
                          NSString *name,         NSString *filename);
@property (nonatomic, strong) NSString       *boundary;    // 分割字符串
@property (nonatomic, strong) NSDictionary   *parameters;  // 携带的参数
@property (nonatomic, strong) NSArray        *pictures;    // 封装好的图片的数据
/**
 *  大体流程就是:
 
 1. 根据参数创建POST头部信息
 
 2. 填充中间的图片信息
 
 3. 用标示符表示结束信息
 
 4. 对HTTPHeaderField进行一些设置
 

 *
 *  @param request <#request description#>
 */
- (void)configRequest:(NSMutableURLRequest **)request;
/*
 使用
 
 
 
 
 
 */
@end
