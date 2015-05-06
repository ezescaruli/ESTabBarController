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


/**
 Initializes the tab bar with the amount of controllers that it will show.
 */
- (instancetype)initWithControllersAmount:(NSInteger)controllersAmount;


/**
 Sets the icons to be shown in each tab button.
 */
- (void)setTabIcons:(NSArray *)tabIcons;


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


@end
