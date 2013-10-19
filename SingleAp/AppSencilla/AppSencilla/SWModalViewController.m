//
//  SWModalViewController.m
//  AppSencilla
//
//  Created by Pablo Formoso Estada on 18/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWModalViewController.h"

@interface SWModalViewController ()

@end

@implementation SWModalViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}








@end
