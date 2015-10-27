
///----------------------------------
///  @name Label
///----------------------------------

#import <UIKit/UIKit.h>

@interface DLLabel : UILabel

// label inset
@property (nonatomic, assign) UIEdgeInsets contentInsets;

- (id)initWithText:(NSString *)text
              font:(UIFont *)font
         textColor:(UIColor *)color;

- (id)initWithText:(NSString *)text
              font:(UIFont *)font
         textColor:(UIColor *)color
   backgroundColor:(UIColor *)backgroundColor;


@end
