
///----------------------------------
///  @name 自定义PageControl
///----------------------------------

#import <UIKit/UIKit.h>

@interface DLPageControl : UIPageControl


@property (nonatomic, strong) UIImage *imagePageStateNormal;
@property (nonatomic, strong) UIImage *imagePageStateHighlighted;

/**
 *  set PageControl indicator sepration distance
 */
@property (nonatomic, assign) NSInteger pageIndicatorSpacing;

/**
 *  set PageControl page counts
 *
 *  @param totalPageNumber    total count
 *  @param currentPageNumber  current page_num
 */
- (void)setTotalAndCurrentPageNumber:(NSInteger)totalPageNumber
                   currentPageNumber:(NSInteger)currentPageNumber;

/**
 *  set PageControl images
 *
 *  @param normalImage          normal image
 *  @param highlightedImage     highlight image
 */
- (void)setImageOfPageNormalAndHighlighted:(UIImage *)normalImage
                          highlightedImage:(UIImage *)highlightedImage;

/**
 *  set PageControl
 *
 *  @param normalImage          normal color
 *  @param highlightedImage     highlight image
 */
- (void)setColorOfBackgroundAndCurrentPageIndicator:(UIColor *)colorOfBackground
                        colorOfCurrentPageIndicator:(UIColor *)colorOfCurrentPageIndicator;

@end
