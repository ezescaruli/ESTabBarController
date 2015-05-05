//
//  ESTabBarController.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/4/15.
//
//

#import "ESTabBarController.h"
#import "UIButton+ESTabBar.h"


@interface ESTabBarController ()

@property (nonatomic, weak) IBOutlet UIView *buttonsContainer;

@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *actions;

@property (nonatomic, assign) BOOL didSetupInterface;

@property (nonatomic, strong) NSMutableArray *buttons;

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
    self.controllers[index] = viewController;
    
    if (self.didSetupInterface) {
        // If the UI was already setup, it's necessary to update it.
        [self setupInterface];
    }
}


- (void)setAction:(ESTabBarAction)action
          atIndex:(NSInteger)index {
    self.actions[index] = action;
    
    if (self.didSetupInterface) {
        // If the UI was already setup, it's necessary to update it.
        [self setupInterface];
    }
}


#pragma mark - Action


- (void)tabButtonAction:(UIButton *)button {
    
}


#pragma mark - Private methods


- (void)initializeWithControllersAmount:(NSInteger)controllersAmount {
    NSAssert(controllersAmount > 0,
             @"The controllers amount should be greater than zero.");
    
    self.controllers = [NSMutableArray arrayWithCapacity:controllersAmount];
    self.actions = [NSMutableArray arrayWithCapacity:controllersAmount];
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
    
    self.buttons = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.controllers.count; i++) {
        UIButton *button = [self createButtonForIndex:i];
        
        [self.buttonsContainer addSubview:button];
        self.buttons[i] = button;
    }
    
    self.buttonsContainer.backgroundColor = self.buttonsBackgroundColor ?: [UIColor lightGrayColor];
}


- (UIButton *)createButtonForIndex:(NSInteger)index {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *buttonImage = [self.controllers[index] tabBarItem].image;
    [button customizeForTabBarWithImage:buttonImage
                          selectedColor:self.selectedColor ?: [UIColor blackColor]
                            highlighted:NO];
    
    [button addTarget:self
               action:@selector(tabButtonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


@end
