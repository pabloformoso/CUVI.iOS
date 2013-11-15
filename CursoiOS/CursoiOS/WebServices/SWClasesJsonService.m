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

// Usando AFNetworking 2.0 valido para XCode5 e iOS6+
- (void)getClasesForController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  // 1 - Creamos la Request
  NSURL *url = [NSURL URLWithString:@"http://curso.softwhisper.es/aecomo_classes.json"];
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
      [_controller performSelector:@selector(updateView:) withObject:_classes];
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

  /* Creación de colas de tareas personalizadas
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  [queue setName:@"network"];
  [queue setMaxConcurrentOperationCount:2];
  [queue addOperation:operation];
   */
}

// Parseamos el JSON que nos llega
- (void)parseJson:(id)responseObject {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _classes = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dic in responseObject) {
    SWClass *temp = [[SWClass alloc] initWithJsonDictionary:dic];
    [_classes addObject:temp];
  }
}

@end
