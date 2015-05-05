//
//  UIButton+ESTabBar.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/5/15.
//
//

#import "UIButton+ESTabBar.h"


@implementation UIButton (ESTabBar)


#pragma mark - Public methods


- (void)customizeForTabBarWithImage:(UIImage *)image
                      selectedColor:(UIColor *)selectedColor
                        highlighted:(BOOL)highlighted {
    if (highlighted) {
        [self customizeAsHighlightedButtonForTabBarWithImage:image
                                               selectedColor:selectedColor];
    } else {
        [self customizeAsNormalButtonForTabBarWithImage:image
                                          selectedColor:selectedColor];
    }
}


#pragma mark - Private methods


- (void)customizeAsHighlightedButtonForTabBarWithImage:(UIImage *)image
                                         selectedColor:(UIColor *)selectedColor {
    
    // We want the image to be always white in highlighted state.
    self.tintColor = [UIColor whiteColor];
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
          forState:UIControlStateNormal];
    
    // And its background color should always be the selected color.
    self.backgroundColor = selectedColor;
}


- (void)customizeAsNormalButtonForTabBarWithImage:(UIImage *)image
                                    selectedColor:(UIColor *)selectedColor {
    
    // The tint color is the one used for selected state.
    self.tintColor = selectedColor;
    
    // When the button is not selected, we show the image always with its
    // original color.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
          forState:UIControlStateNormal];
    
    // When the button is selected, we apply the tint color using the
    // always template mode.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
          forState:UIControlStateSelected];
    
    // We don't want a background color to use the one in the tab bar.
    self.backgroundColor = [UIColor clearColor];
}


@end
