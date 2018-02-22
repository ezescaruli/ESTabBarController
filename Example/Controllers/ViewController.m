//
//  ViewController.m
//  Example
//
//  Created by Ezequiel Scaruli on 5/4/15.
//  Copyright (c) 2015 Ezequiel Scaruli. All rights reserved.
//

#import <ESTabBarController/ESTabBarController.h>
#import <UIColor-HexString/UIColor+HexString.h>

#import "ViewController.h"
#import "ArchiveViewController.h"
#import "ClockViewController.h"
#import "MapViewController.h"
#import "GlobeViewController.h"


@implementation ViewController


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // Instance creation.
    ESTabBarController *tabBarController = [[ESTabBarController alloc] initWithTabIconNames:@[@"archive",
                                                                                              @"clock",
                                                                                              @"target",
                                                                                              @"map",
                                                                                              @"globe"]];
    
    // Add child view controller.
    
    [self addChildViewController:tabBarController];
    
    [self.view addSubview:tabBarController.view];
    tabBarController.view.frame = self.view.bounds;
    
    [tabBarController didMoveToParentViewController:self];
    
    // View controllers.
    
    [tabBarController setViewController:[[ArchiveViewController alloc] init]
                                atIndex:0];
    
    [tabBarController setViewController:[[ClockViewController alloc] init]
                                atIndex:1];
    
    [tabBarController setViewController:[[MapViewController alloc] init]
                                atIndex:3];
    
    [tabBarController setViewController:[[GlobeViewController alloc] init]
                                atIndex:4];
    
    // Colors.
    
    tabBarController.selectedColor = [UIColor colorWithHexString:@"#CD5B45"];
    tabBarController.buttonsBackgroundColor = [UIColor colorWithHexString:@"#F6EBE0"];
    
    // Highlighted buttons.
    
    [tabBarController highlightButtonAtIndex:2];
    
    // Actions.
    
    __weak typeof (self) weakSelf = self;
    
    [tabBarController setAction:^{
        [weakSelf showAlertViewWithTitle:@"Highlighted"
                                 message:@"You have chosen the highlighted tab button."];
    } atIndex:2];
    
    [tabBarController setAction:^{
        [weakSelf showAlertViewWithTitle:@"Globe"
                                 message:@"You have chosen the globe view controller."];
    } atIndex:4];
}


#pragma mark - Private methods

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
