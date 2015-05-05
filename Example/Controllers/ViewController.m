//
//  ViewController.m
//  Example
//
//  Created by Ezequiel Scaruli on 5/4/15.
//  Copyright (c) 2015 Ezequiel Scaruli. All rights reserved.
//

#import <ESTabBarController/ESTabBarController.h>

#import "ViewController.h"


@implementation ViewController


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ESTabBarController *tabBarController = [[ESTabBarController alloc] initWithControllersAmount:5];
    
    [self addChildViewController:tabBarController];
    
    [self.view addSubview:tabBarController.view];
    tabBarController.view.frame = self.view.bounds;
    
    [tabBarController didMoveToParentViewController:self];
    
    [tabBarController setViewController:[self viewControllerWithImageNamed:@"archive"]
                                atIndex:0];
    
    [tabBarController setViewController:[self viewControllerWithImageNamed:@"clock"]
                                atIndex:1];
    
    [tabBarController setViewController:[self viewControllerWithImageNamed:@"target"]
                                atIndex:2];
    
    [tabBarController setViewController:[self viewControllerWithImageNamed:@"map"]
                                atIndex:3];
    
    [tabBarController setViewController:[self viewControllerWithImageNamed:@"globe"]
                                atIndex:4];
}


#pragma mark - Private methods


- (UIViewController *)viewControllerWithImageNamed:(NSString *)imageName {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    return viewController;
}


@end
