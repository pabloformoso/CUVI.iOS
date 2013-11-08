//
//  SWClasesJsonService.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 09/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "AFNetworking.h"
#import "SWClass.h"
#import "SWClasesJsonService.h"

@interface SWClasesJsonService ()
@property (nonatomic, strong) NSMutableArray *classes;
@property (nonatomic, strong) id controller;
@end

@implementation SWClasesJsonService

- (void)getClasesForController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  NSURL *url = [NSURL URLWithString:@"http://curso.softwhisper.es/aecomo_classes.json"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  operation.responseSerializer = [AFJSONResponseSerializer serializer];

#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

    _classes = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in responseObject) {
      SWClass *temp = [[SWClass alloc] initWithJsonDictionary:dic];
      [_classes addObject:temp];
    }
    
    if ([_controller respondsToSelector:@selector(updateView:)]) {
      [_controller performSelector:@selector(updateView:) withObject:_classes];
#ifndef NDEBUG
      NSLog(@"%s (line:%d) end json", __PRETTY_FUNCTION__, __LINE__);
#endif
    }
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  }];
  
  [operation start];
}

@end
