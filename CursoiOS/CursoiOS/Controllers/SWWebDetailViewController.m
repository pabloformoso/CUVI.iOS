//
//  SWWebDetailViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWResource.h"
#import "UIWebView+AFNetworking.h"
#import "SWWebDetailViewController.h"

@interface SWWebDetailViewController ()

@end

@implementation SWWebDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSURL *url = [NSURL URLWithString:_resource.link];
  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
  [_webView loadRequest:req progress:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {

      [MBProgressHUD hideHUDForView:self.view animated:YES];

  } success:^NSString *(NSHTTPURLResponse *response, NSString *HTML) {
    
    return @"";
  } failure:^(NSError *error) {
    
  }];
  
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  // Comparar la url del recursos para activar o desactivar el boton de back
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  if ([_webView canGoBack]) {
    [_webView goBack];
  }
  
}
@end
