
///----------------------------------
///  @name 扩展TextField
///----------------------------------

#import <UIKit/UIKit.h>

@interface DLTextField : UITextField

// placeholder color
@property (nonatomic, retain) UIColor *placeholderTextColor;
// placeholder font
@property (nonatomic, retain) UIFont *placeholderFont;
// text padding
@property (nonatomic, assign) UIEdgeInsets textInsets;

@end
