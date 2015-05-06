ESTabBarController
========================

[![Build Status](https://api.travis-ci.org/ezescaruli/ESTabBarController.svg?branch=master)](https://travis-ci.org/ezescaruli/ESTabBarController)
![Pod Platform](http://img.shields.io/cocoapods/v/ESTabBarController.svg?style=flat)

`ESTabBarController` is a custom tab bar controller for iOS. It has a tab indicator that moves animated along the bar when switching between tabs. It also provides the capability of running actions associated with the tab bar buttons.

Compatible with iOS 7.0 and above.


<img src="./Readme/Demo.gif" alt="Demo" width="320"/>


## Installation

Simply add `ESTabBarController` to your `Podfile`:
```ruby
pod 'ESTabBarController'
```

## Usage


### Initialization

`ESTabBarController` is initialized with an array of images that represent icons for the buttons in the tab bar:
```objc
ESTabBarController *tabBarController = [[ESTabBarController alloc] initWithTabIcons:@[[UIImage imageNamed:@"firstIcon"],
                                                                                      [UIImage imageNamed:@"secondIcon"],
                                                                                      [UIImage imageNamed:@"thirdIcon"]]];
```

If the images are all loaded from the main bundle, a convenience initializer can be used:
```objc
ESTabBarController *tabBarController = [[ESTabBarController alloc] initWithTabIconNames:@[@"firstIcon", @"secondIcon", @"thirdIcon"]];
```


### View controllers

View controllers are set in the way:
```objc
[tabBarController setViewController:myFirstViewController
                            atIndex:0];

[tabBarController setViewController:mySecondViewController
                            atIndex:2];
```
Note that it is possible to have an index without an associated view controller. This can be useful when having a button that performs an action but does not switch to a view controller.


### Actions

`ESTabBarController` allows performing actions when pressing a button in the tab bar:
```objc
[tabBarController setAction:^{
    // Perform an action.
} atIndex:1];
```
If there is also a controller associated with the index for an action, this is performed immediately after switching to the controller.

### Highlighted buttons

`ESTabBarController` allows having highlighted buttons. These are displayed in a different way, and are useful when trying to give more importance to a view controller or action.
```objc
[tabBarController highlightButtonAtIndex:1];
```

### Colors

`ESTabBarController` provides a way to customize two colors:
- The color of the selected buttons and the selection indicator:
```objc
tabBarController.selectedColor = [UIColor redColor]; // Any color.
```
- The background color of the buttons:
```objc
tabBarController.buttonBackgroundColor = [UIColor grayColor]; // Any color.
```

### Example

More usage information can be found in the Example project.


## License

This library is available under the [MIT license](http://www.opensource.org/licenses/mit-license.php).
