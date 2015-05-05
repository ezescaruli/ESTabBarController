//
//  ESTabBarController.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/4/15.
//
//

#import "ESTabBarController.h"
#import "UIButton+ESTabBar.h"
#import "ESTabBarController+Autolayout.h"


@interface ESTabBarController ()

@property (nonatomic, weak) IBOutlet UIView *buttonsContainer;

@property (nonatomic, assign) NSInteger controllersAmount;
@property (nonatomic, strong) NSMutableDictionary *controllers;
@property (nonatomic, strong) NSMutableDictionary *actions;

@property (nonatomic, assign) BOOL didSetupInterface;

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSMutableSet *highlightedButtonIndexes;

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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupInterface];
}


#pragma mark - Public methods


- (void)setViewController:(UIViewController *)viewController
                  atIndex:(NSInteger)index {
    self.controllers[@(index)] = viewController;
    [self setupInterfaceIfNeeded];
}


- (void)setAction:(ESTabBarAction)action
          atIndex:(NSInteger)index {
    self.actions[@(index)] = action;
    [self setupInterfaceIfNeeded];
}


- (void)highlightButtonAtIndex:(NSInteger)index {
    [self.highlightedButtonIndexes addObject:@(index)];
    [self setupInterfaceIfNeeded];
}


#pragma mark - Action


- (void)tabButtonAction:(UIButton *)button {
    
}


#pragma mark - Private methods


- (void)initializeWithControllersAmount:(NSInteger)controllersAmount {
    NSAssert(controllersAmount > 0,
             @"The controllers amount should be greater than zero.");
    
    self.controllersAmount = controllersAmount;
    
    self.controllers = [NSMutableDictionary dictionaryWithCapacity:controllersAmount];
    self.actions = [NSMutableDictionary dictionaryWithCapacity:controllersAmount];
    
    self.highlightedButtonIndexes = [NSMutableSet set];
}


- (void)setupInterfaceIfNeeded {
    if (self.didSetupInterface) {
        // If the UI was already setup, it's necessary to update it.
        [self setupInterface];
    }
}


- (void)setupInterface {
    [self setupButtons];
    self.didSetupInterface = YES;
}


- (void)setupButtons {
    // First, I remove the previous buttons. They could have an outdated image.
    for (UIButton *button in self.buttons) {
        [button removeFromSuperview];
    }
    
    self.buttons = [NSMutableArray arrayWithCapacity:self.controllersAmount];
    
    for (NSInteger i = 0; i < self.controllersAmount; i++) {
        UIButton *button = [self createButtonForIndex:i];
        
        [self.buttonsContainer addSubview:button];
        self.buttons[i] = button;
    }
    
    [self setupButtonsConstraints];
    self.buttonsContainer.backgroundColor = self.buttonsBackgroundColor ?: [UIColor lightGrayColor];
}


- (UIButton *)createButtonForIndex:(NSInteger)index {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *buttonImage = [self.controllers[@(index)] tabBarItem].image;
    BOOL isHighlighted = [self.highlightedButtonIndexes containsObject:@(index)];
    [button customizeForTabBarWithImage:buttonImage
                          selectedColor:self.selectedColor ?: [UIColor blackColor]
                            highlighted:isHighlighted];
    
    [button addTarget:self
               action:@selector(tabButtonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


@end
