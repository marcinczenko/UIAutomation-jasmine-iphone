//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Marcin Czenko on 7/19/11.
//  Copyright 2011 Everyday Productive. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@property (nonatomic, strong) IBOutlet UILabel* label;

@end

@implementation HelloWorldViewController

@synthesize label = _label;

- (void) buttonPressed:(UIButton *)sender
{
    self.label.text = @"Hello World !";
    
    NSLog(@"%s","Button Pressed!");
}

- (void) resetPressed:(UIButton *)sender
{
    self.label.text = @"";
    
    NSLog(@"%s","Button Reset!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.label.text = @"";
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
