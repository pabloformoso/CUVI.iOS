//
//  SWClassDetailViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWClass.h"
#import "SWClassDetailViewController.h"

@interface SWClassDetailViewController ()

@end

@implementation SWClassDetailViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewWillAppear:animated];
    [self loadUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos privados
- (void)loadUI {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [_classNameLabel setText:_selectedClass.name];
    [_descTextView setText:_selectedClass.description];
  
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd-MM-yyyy"];
    [formater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es"]];
    
    [_startLabel setText:[formater stringFromDate:_selectedClass.startDate]];
    
    [formater setDateFormat:@"MMMM-dd-yyyy"];
    
    [_endLabel setText:[formater stringFromDate:_selectedClass.endDate]];
}











@end
