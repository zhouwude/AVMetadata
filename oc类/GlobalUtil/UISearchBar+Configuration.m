//
//  UISearchBar+Configuration.m
//  iHummingBird
//
//  Created by Tang Shilei on 14-10-9.
//  Copyright (c) 2014年 HummingBird. All rights reserved.
//

#import "UISearchBar+Configuration.h"

@implementation UISearchBar (Configuration)

-(void)configBackground
{
    float version = [[[ UIDevice currentDevice ] systemVersion ] floatValue ];
    if ([ self respondsToSelector : @selector (barTintColor)]) {
        
        float  iosversion7_1 = 7.1 ;
        
        if (version >= iosversion7_1)
            
        {
            
            //iOS7.1
            
            [[[[ self . subviews objectAtIndex : 0 ] subviews] objectAtIndex : 0 ]  removeFromSuperview ];
            [ self setBackgroundColor :[UIColor   clearColor ]];
        }
        
        else
            
        {
            
            //iOS7.0
            [ self setBarTintColor :[ UIColor clearColor ]];
            [ self setBackgroundColor :[ UIColor clearColor ]];
            
        }
        
    }
    
    
    else
        
    {
        
        //iOS7.0 以下
        [[ self . subviews objectAtIndex : 0 ] removeFromSuperview ];
        [ self setBackgroundColor :[ UIColor clearColor ]];
    }

    
    
}


@end
