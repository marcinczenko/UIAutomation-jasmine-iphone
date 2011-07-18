//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Marcin Czenko on 7/19/11.
//  Copyright 2011 Everyday Productive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HelloWorldViewController *viewController;

@end
