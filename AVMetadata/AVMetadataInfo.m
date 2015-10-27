//
//  AVMetadataInfo.m
//  AVMetadata
//
//  Created by 周武德 on 15/10/27.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "AVMetadataInfo.h"

@implementation AVMetadataInfo
+ (NSDictionary *)dataInfoFromFileURL:(NSURL *)fileURL
{
    // 创建字典
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    // 创建信号量(将异步变成同步)
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    AVAsset *asset = [AVURLAsset URLAssetWithURL:fileURL options:nil];
    [asset loadValuesAsynchronouslyForKeys:@[@"commonMetadata"]
                         completionHandler:^{
                             // 发送信号量
                             dispatch_semaphore_signal(semaphore);
                         }];
    
    // 无限等待
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    // 获取数据
    NSArray *artworks = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata
                                                       withKey:AVMetadataCommonKeyArtwork
                                                      keySpace:AVMetadataKeySpaceCommon];
    for (AVMetadataItem *item in artworks)
    {
        if ([item.keySpace isEqualToString:AVMetadataKeySpaceID3])
        {
            NSDictionary *dict = [item.value copyWithZone:nil];
            
            // 获取图片
            
            UIImage  *image = [UIImage imageWithData:[dict objectForKey:@"data"]];
            [dic setObject:image forKey:@"Artwork"];
        }
        if ([item.keySpace isEqualToString:AVMetadataKeySpaceiTunes])
        {
            // 获取图片
            UIImage *image = [UIImage imageWithData:[item.value copyWithZone:nil]];
            [dic setObject:image forKey:@"Artwork"];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:dic];
}

@end
