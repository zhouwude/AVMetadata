//
//  InstagramFeedTableViewCell.m
//  iOS8SelfSizingCells
//
//  Created by dw_iOS on 14-10-22.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "InstagramFeedTableViewCell.h"

#import "InstagramItem.h"

@implementation InstagramFeedTableViewCell


//在nssting中解析URL的方法

- (NSMutableAttributedString *)filterLinkWithContent:(NSString *)content {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSError *error = NULL;
    NSDataDetector *detector =
    [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber
                                    error:&error];
    NSArray *matches = [detector matchesInString:content
                                         options:0
                                           range:NSMakeRange(0, [content length])];
    for (NSTextCheckingResult *match in matches) {
        
        if (([match resultType] == NSTextCheckingTypeLink)) {
            
            NSURL *url = [match URL];
            [attributedString addAttribute:NSLinkAttributeName value:url range:match.range];
            [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:[match range]];
        }
    }
    return attributedString;
}

- (void)setInstagramItem:(InstagramItem *)instagramItem {
    _instagramItem = instagramItem;
    
    self.likeLabel.text = [NSString stringWithFormat:@"%@ 次赞", instagramItem.likeCount];
    
    NSLog(@"!!!!!%@",instagramItem.comment);
    
    self.commentLabel.attributedText = [self filterLinkWithContent:instagramItem.comment];
    //self.commentLabel.text = instagramItem.comment;
}

- (void)awakeFromNib {
    // Initialization code
    CGFloat radio = CGRectGetWidth(self.leftCircleView.bounds) / 2.0;
    self.leftCircleView.layer.cornerRadius = radio;
    self.centerCircleView.layer.cornerRadius = radio;
    self.rightCircleView.layer.cornerRadius = radio;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
