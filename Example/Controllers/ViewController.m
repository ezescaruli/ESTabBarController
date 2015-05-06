//
//  ViewController.m
//  Example
//
//  Created by Ezequiel Scaruli on 5/4/15.
//  Copyright (c) 2015 Ezequiel Scaruli. All rights reserved.
//

#import <ESTabBarController/ESTabBarController.h>

#import "ViewController.h"
#import "ArchiveViewController.h"
#import "ClockViewController.h"
#import "MapViewController.h"
#import "GlobeViewController.h"


@implementation ViewController


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ESTabBarController *tabBarController = [[ESTabBarController alloc] initWithControllersAmount:5];
    
    [self addChildViewController:tabBarController];
    
    [self.view addSubview:tabBarController.view];
    tabBarController.view.frame = self.view.bounds;
    
    [tabBarController didMoveToParentViewController:self];
    
    [tabBarController setTabIcons:@[[UIImage imageNamed:@"archive"],
                                    [UIImage imageNamed:@"clock"],
                                    [UIImage imageNamed:@"target"],
                                    [UIImage imageNamed:@"map"],
                                    [UIImage imageNamed:@"globe"]]];
    
    [tabBarController setViewController:[[ArchiveViewController alloc] init]
                                atIndex:0];
    
    [tabBarController setViewController:[[ClockViewController alloc] init]
                                atIndex:1];
    
    [tabBarController setViewController:[[MapViewController alloc] init]
                                atIndex:3];
    
    [tabBarController setViewController:[[GlobeViewController alloc] init]
                                atIndex:4];
    
    [tabBarController highlightButtonAtIndex:2];
}


@end
