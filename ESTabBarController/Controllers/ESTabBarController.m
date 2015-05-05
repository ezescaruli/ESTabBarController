//
//  ESTabBarController.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/4/15.
//
//

#import "ESTabBarController.h"


@interface ESTabBarController ()

@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *actions;

@end


@implementation ESTabBarController


#pragma mark - Init


- (instancetype)initWithControllersAmount:(NSInteger)controllersAmount {
    self = [self initWithNibName:@"ESTabBarController" bundle:nil];
    
    if (self != nil) {
        [self initializeWithControllersAmount:controllersAmount];
    }
    
    return self;
}


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Public methods


- (void)setViewController:(UIViewController *)viewController
                  atIndex:(NSInteger)index {
    self.controllers[index] = viewController;
}


- (void)setAction:(ESTabBarAction)action
          atIndex:(NSInteger)index {
    self.actions[index] = action;
}


#pragma mark - Private methods


- (void)initializeWithControllersAmount:(NSInteger)controllersAmount {
    NSAssert(controllersAmount > 0,
             @"The controllers amount should be greater than zero.");
    
    self.controllers = [NSMutableArray arrayWithCapacity:controllersAmount];
    self.actions = [NSMutableArray arrayWithCapacity:controllersAmount];
}


@end
