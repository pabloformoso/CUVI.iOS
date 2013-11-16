//
//  SWClassDetailViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "AudioStreamer.h"
#import "SWClass.h"
#import "SWClassDetailViewController.h"

@interface SWClassDetailViewController ()
@property (nonatomic, strong) AudioStreamer *player;
@end

@implementation SWClassDetailViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
  
  _player = [[AudioStreamer alloc] initWithURL:[NSURL URLWithString:@"http://vpr.streamguys.net/vpr96.mp3"]];
  
  [_player start];
  
  [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
  [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadUI];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
  [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
  [self resignFirstResponder];
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


- (IBAction)back:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self.navigationController popToRootViewControllerAnimated:YES];
}









@end
