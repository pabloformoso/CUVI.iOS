//
//  SWResourcesJsonService.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWResource.h"
#import "AFNetworking.h"
#import "SWResourcesJsonService.h"

@interface SWResourcesJsonService ()

@property (nonatomic, strong) id controller;
@property (nonatomic, strong) NSMutableArray *resources;

@end

@implementation SWResourcesJsonService

- (void)getResourcesForController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  // 1 - Creamos la Request
  NSURL *url = [NSURL URLWithString:@"http://curso.softwhisper.es/resources.json"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  // 2 - Creamos la intancia de AFNetworking para la request y fijamos el serializer
  AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  operation.responseSerializer = [AFJSONResponseSerializer serializer];
  
  // 3 - Le indicamos que hacer en caso de ejecutarse correctamente o en caso de fallo
  [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    // 4 - Lanzamos el JSON
    [self parseJson:responseObject];
    
    // 5 - Devolvemos los datos a la UI
    if ([_controller respondsToSelector:@selector(updateView:)]) {
      [_controller performSelector:@selector(updateView:) withObject:_resources];
    }
    
#ifndef NDEBUG
    NSLog(@"%s (line:%d) end json", __PRETTY_FUNCTION__, __LINE__);
#endif
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  }];
  
  //[operation start];
  [[NSOperationQueue mainQueue] addOperation:operation];
}

- (void)parseJson:(id)responseObject {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _resources = [[NSMutableArray alloc] init];
  for (NSDictionary *dic in responseObject) {
    SWResource *tmp = [[SWResource alloc] initWithJSonDictionary:dic];
    [_resources addObject:tmp];
  }
  
}

@end
