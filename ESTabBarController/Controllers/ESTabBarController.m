//
//  ESTabBarController.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/4/15.
//
//

#import "ESTabBarController.h"


@interface ESTabBarController ()

@property (nonatomic, assign) NSInteger controllersAmount;

@end


@implementation ESTabBarController


#pragma mark - Init


- (instancetype)initWithControllersAmount:(NSInteger)controllersAmount {
    self = [self initWithNibName:@"ESTabBarController" bundle:nil];
    
    if (self != nil) {
        self.controllersAmount = controllersAmount;
    }
    
    return self;
}


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}



@end
