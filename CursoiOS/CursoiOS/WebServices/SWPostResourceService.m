//
//  SWPostResourceService.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

 /*
 */

#import "SWResource.h"
#import "AFNetworking.h"
#import "SWPostResourceService.h"

@interface SWPostResourceService ()

@end

@implementation SWPostResourceService

- (void)createResource:(SWResource *)res fromController:(id)aController {
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  NSDictionary *parameters = @{
                               @"resource[name]": res.name,
                               @"resource[link]": res.link,
                               @"resource[description]": res.description
                                  };
 
  
  [manager POST:@"http://curso.softwhisper.es/resource.json"
    parameters:parameters
   
  success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if ([aController respondsToSelector:@selector(updateView:)]) {
      [aController performSelector:@selector(updateView:) withObject:@"OK"];
    }
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    if ([aController respondsToSelector:@selector(updateView:)]) {
      [aController performSelector:@selector(updateView:) withObject:@"KO"];
    }
  }];
}

@end
