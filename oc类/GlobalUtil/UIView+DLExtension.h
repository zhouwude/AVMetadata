
///----------------------------------
///  @name 视图Frame操作
///----------------------------------

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DLBadgeStyle)
{
    DLBadgeStyleRedDot = 0,
    DLBadgeStyleNumber,
    DLBadgeStyleNew
};

typedef NS_ENUM(NSUInteger, DLBadgeAnimType)
{
    DLBadgeAnimTypeNone = 0,
    DLBadgeAnimTypeScale,
    DLBadgeAnimTypeShake,
    DLBadgeAnimTypeBreathe          
};

@interface UIView (DLExtension)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGSize boundsSize;
@property (nonatomic, assign) CGFloat boundsWidth;
@property (nonatomic, assign) CGFloat boundsHeight;
@property (nonatomic, readonly) CGRect contentBounds;
@property (nonatomic, readonly) CGPoint contentCenter;

- (void)shakeView;

@property (nonatomic, strong) UILabel *badge;
@property (nonatomic, strong) UIColor *badgeBgColor;
@property (nonatomic, strong) UIColor *badgeTextColor;
@property (nonatomic, assign) CGRect badgeFrame;
@property (nonatomic, assign) DLBadgeAnimType aniType;

- (void)shoDLBadge;
- (void)shoDLBadgeWithStyle:(DLBadgeStyle)style value:(NSInteger)value animationType:(DLBadgeAnimType)aniType;
- (void)clearBadge;

@end
