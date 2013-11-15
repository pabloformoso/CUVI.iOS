//
//  SWWebDetailViewController.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWResource;
#import <UIKit/UIKit.h>

@interface SWWebDetailViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) SWResource *resource;

- (IBAction)back:(id)sender;

@end
