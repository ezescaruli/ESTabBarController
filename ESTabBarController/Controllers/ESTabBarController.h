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

- (void)setViewController:(UIViewController *)viewController
                  atIndex:(NSInteger)index;

- (void)setAction:(ESTabBarAction)action
          atIndex:(NSInteger)index;

@end
