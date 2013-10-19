//
//  SWDataViewController.m
//  PruebaDePagina
//
//  Created by Pablo Formoso Estada on 18/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWDataViewController.h"

@interface SWDataViewController ()

@end

@implementation SWDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    
    _dataLabel2.text = [NSString stringWithFormat:@"%@ - HOLA - %@", [_dataObject description], [_dataObject description]];
}

@end
