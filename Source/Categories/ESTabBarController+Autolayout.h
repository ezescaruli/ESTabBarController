//
//  ESTabBarController+Autolayout.h
//  Pods
//
//  Created by Ezequiel Scaruli on 5/5/15.
//
//

#import "ESTabBarController.h"


@interface ESTabBarController (Autolayout)

- (void)setupButtonsConstraints;
- (void)setupSelectionIndicatorConstraints;
- (void)setupConstraintsForChildController:(UIViewController *)controller;

@end
