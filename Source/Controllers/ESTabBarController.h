//
//  ESTabBarController.h
//  Pods
//
//  Created by Ezequiel Scaruli on 5/4/15.
//
//

#import <UIKit/UIKit.h>

typedef void (^ESTabBarAction)(void);


@interface ESTabBarController : UIViewController


/// Color to use for when a tab bar button is selected.
@property (nonatomic, strong) UIColor *selectedColor;

/// Background color for the view that contains the buttons.
@property (nonatomic, strong) UIColor *buttonsBackgroundColor;

/// The index (starting from 0) of the view controller being shown.
@property (nonatomic, readonly) NSInteger selectedIndex;

/// Defaults to NO.
@property (nonatomic, assign) BOOL separatorLineVisible;

// Defaults to [UIColor lightGrayColor].
@property (nonatomic, strong) UIColor *separatorLineColor;

// This maked the selected button look with a full alpha, and the non selected
// ones a bit transparent.
@property (nonatomic, assign) BOOL highlightsSelectedButton;

// The current view controller stack.
@property (nonatomic, copy, readonly) NSArray *viewControllers;

// Color to use for badge text
// Defaults to [UIColor whiteColor]
@property (nonatomic, strong) UIColor *badgeTextColor;

// Font for badge text
// Defaults to [UIFont systemFontOfSize:8]
@property (nonatomic, strong) UIFont *badgeFont;

// Badge width and height in pt
// Defaults to 16
@property (nonatomic, assign) NSInteger badgeSize;

// Badge offset from button's center (up and right)
// Defaults to 12
@property (nonatomic, assign) NSInteger badgeOffset;


/**
 Initializes the tab bar with an array of UIImage that will be the icons
 to show in the tab bar.
 */
- (instancetype)initWithTabIcons:(NSArray *)tabIcons;


/**
 Convenience initializer that receives an array of NSString images names.
 */
- (instancetype)initWithTabIconNames:(NSArray *)tabIconNames;


/**
 Sets the view controller to be shown when tapping a button at a specific
 index.
 */
- (void)setViewController:(UIViewController *)viewController
                  atIndex:(NSInteger)index;

/**
 Sets an action to be fired when tapping a button at a specific index. If there
 is also a view controller set at that index, the action is fired immediately
 after showing it.
 */
- (void)setAction:(ESTabBarAction)action
          atIndex:(NSInteger)index;


/**
 Makes a button at a specific index look highlighted.
 */
- (void)highlightButtonAtIndex:(NSInteger)index;


/**
 Sets the tint color of a button at a specified index.
 It only works for non highlighted buttons.
 */
- (void)setButtonTintColor:(UIColor *)color atIndex:(NSInteger)index;


/**
 Hides the bottom bar. Can be animated.
 */
- (void)setBarHidden:(BOOL)hidden animated:(BOOL)animated;


/**
 Sets the selected index of the controller, as if pressing one of the tab
 buttons. Can be animated.
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;

/**
 Sets the badge text value.
 Set nil to remove badge.
 */
- (void)setBadgeValue:(NSString*)value atIndex:(NSInteger)index;

@end
