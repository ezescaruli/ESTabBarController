//
//  UIButton+ESTabBar.h
//  Pods
//
//  Created by Ezequiel Scaruli on 5/5/15.
//
//

#import <UIKit/UIKit.h>


@interface UIButton (ESTabBar)

- (void)customizeForTabBarWithImage:(UIImage *)image
                      selectedColor:(UIColor *)selectedColor
                        highlighted:(BOOL)highlighted;

@end
