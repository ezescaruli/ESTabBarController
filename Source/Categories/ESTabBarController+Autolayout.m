//
//  ESTabBarController+Autolayout.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/5/15.
//
//

#import "ESTabBarController+Autolayout.h"


@interface ESTabBarController ()

@property (nonatomic, weak) UIView *controllersContainer;
@property (nonatomic, weak) UIView *buttonsContainer;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, assign) NSArray *tabIcons;
@property (nonatomic, strong) UIView *selectionIndicator;
@property (nonatomic, strong) NSLayoutConstraint *selectionIndicatorLeadingConstraint;
@property (nonatomic, assign) CGFloat buttonsContainerHeightConstraintInitialConstant;

@end


@implementation ESTabBarController (Autolayout)


#pragma mark - Public methods


- (void)setupButtonsConstraints {

    // In case dumb user doesn't know math
    if(self.widthPercentages!=nil && self.widthPercentages.count
       != self.tabIcons.count && [[self.widthPercentages valueForKeyPath:@"@sum.self"] floatValue] != 1.0) {
      self.widthPercentages = nil;
    }
    for (NSInteger i = 0; i < self.tabIcons.count; i++) {
        [self.buttons[i] setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self.view addConstraints:[self leftLayoutConstraintsForButtonAtIndex:i]];
        [self.view addConstraints:[self verticalLayoutConstraintsForButtonAtIndex:i]];
        [self.view addConstraint:[self widthLayoutConstraintForButtonAtIndex:i]];
        [self.view addConstraint:[self heightLayoutConstraintForButtonAtIndex:i]];
    }
}


- (void)setupSelectionIndicatorConstraints {
    self.selectionIndicatorLeadingConstraint = [self leadingLayoutConstraintForIndicator];

    [self.buttonsContainer addConstraint:self.selectionIndicatorLeadingConstraint];
    [self.buttonsContainer addConstraints:[self widthLayoutConstraintsForIndicator]];
    [self.buttonsContainer addConstraints:[self heightLayoutConstraintsForIndicator]];
    [self.buttonsContainer addConstraints:[self bottomLayoutConstraintsForIndicator]];
}


- (void)setupConstraintsForChildController:(UIViewController *)controller {
    NSDictionary *views = @{@"view": controller.view};

    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[view]-0-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:views];
    [self.controllersContainer addConstraints:horizontalConstraints];

    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:views];
    [self.controllersContainer addConstraints:verticalConstraints];
}


#pragma mark - Private methods


- (NSArray *)leftLayoutConstraintsForButtonAtIndex:(NSInteger)index {
    UIButton *button = self.buttons[index];
    NSArray *leftConstraints;

    if (index == 0) {
        // First button. Stick it to its left margin.
        leftConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(0)-[button]"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:@{@"button": button}];
    } else {
        NSDictionary *views = @{@"previousButton": self.buttons[index - 1],
                                @"button": button};

        // Stick the button to the previous one.
        leftConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[previousButton]-(0)-[button]"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:views];
    }

    return leftConstraints;
}


- (NSArray *)verticalLayoutConstraintsForButtonAtIndex:(NSInteger)index {
    UIButton *button = self.buttons[index];

    // The button is sticked to its top and bottom margins.
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[button]"
                                                   options:0
                                                   metrics:nil
                                                     views:@{@"button": button}];
}


- (NSLayoutConstraint *)widthLayoutConstraintForButtonAtIndex:(NSInteger)index {
    UIButton *button = self.buttons[index];
    CGFloat width = 1.0/self.buttons.count;
    if (self.widthPercentages) {
      width = [[self.widthPercentages objectAtIndex:index] floatValue];
    }

    return [NSLayoutConstraint constraintWithItem:button
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.buttonsContainer
                                        attribute:NSLayoutAttributeWidth
                                       multiplier:width
                                         constant:0.0];
}


- (NSLayoutConstraint *)heightLayoutConstraintForButtonAtIndex:(NSInteger)index {
    UIButton *button = self.buttons[index];

    return [NSLayoutConstraint constraintWithItem:button
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                         constant:self.buttonsContainerHeightConstraintInitialConstant];
}


- (NSLayoutConstraint *)leadingLayoutConstraintForIndicator {
    if(self.indicatorSizeRationalToIcon){
        return [NSLayoutConstraint constraintWithItem:self.selectionIndicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.buttons[0] attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    } else {
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(0)-[selectionIndicator]"
                                                                                                   options:0
                                                                                                   metrics:nil
                                                                                                     views:@{@"selectionIndicator": self.selectionIndicator}];
                                
        return [constraints firstObject];
    }
    
}


- (NSArray *)widthLayoutConstraintsForIndicator {
    if(self.indicatorSizeRationalToIcon){
        return @[[NSLayoutConstraint constraintWithItem:self.selectionIndicator
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:[self.buttons[0] valueForKey:@"imageView"]
                                            attribute:NSLayoutAttributeWidth
                                           multiplier:1.0
                                             constant:0.0]];
    } else {
         NSDictionary *views = @{@"button": self.buttons[0],
                                 @"selectionIndicator": self.selectionIndicator};
        
         return [NSLayoutConstraint constraintsWithVisualFormat:@"[selectionIndicator(==button)]"
                                                        options:0
                                                        metrics:nil
                                                          views:views];

    }
}


- (NSArray *)heightLayoutConstraintsForIndicator {
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:[selectionIndicator(==3)]"
                                                   options:0
                                                   metrics:nil
                                                     views:@{@"selectionIndicator": self.selectionIndicator}];
}


//TODO: BEFORE CREATING A FULL REQUEST WITH THE FORK RETURN THE VALUE HERE TO ZERO
- (NSArray *)bottomLayoutConstraintsForIndicator {
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:[selectionIndicator]-(2)-|"
                                                   options:0
                                                   metrics:nil
                                                     views:@{@"selectionIndicator": self.selectionIndicator}];
}

@end
