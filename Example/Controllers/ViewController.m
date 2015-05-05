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
    
    UIViewController *archiveViewController = [[UIViewController alloc] init];
    archiveViewController.tabBarItem.image = [UIImage imageNamed:@"archive"];
    
    [tabBarController setViewController:archiveViewController atIndex:0];
}


@end
