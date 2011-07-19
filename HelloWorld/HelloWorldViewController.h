//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Marcin Czenko on 7/19/11.
//  Copyright 2011 Everyday Productive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController

@property (strong) IBOutlet UILabel* label;

- (IBAction)buttonPressed:(UIButton*)sender;
- (IBAction)resetPressed:(UIButton*)sender;

@end
