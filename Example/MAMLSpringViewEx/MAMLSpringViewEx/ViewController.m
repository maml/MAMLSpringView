//
//  ViewController.m
//  MAMLSpringViewEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MAMLPopContainerView *springView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.springView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)springViewWasTouched
{
    [self.springView toggleState];
}

- (void)springViewStateDidChange:(ViewState)state
{}

@end
