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

- (instancetype)initWithControllersAmount:(NSInteger)controllersAmount;

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

@end
