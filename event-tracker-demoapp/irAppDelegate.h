//
//  irAppDelegate.h
//  DemoApplication
//
//  Created by Tyler Thomas
//  Copyright (c) 2017 Impact Radius. All rights reserved.
//

#import <UIKit/UIKit.h>

@class irViewController;

@interface irAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) irViewController *viewController;

@end
