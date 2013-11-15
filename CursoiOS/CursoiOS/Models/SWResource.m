//
//  SWResource.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWResource.h"

@implementation SWResource

- (id)initWithJSonDictionary:(NSDictionary *)dic {
  self = [super init];
  
  if (self) {
    _recursoId = [[dic valueForKey:@"id"] integerValue];
    _name = [dic objectForKey:@"name"];
    _link = [dic objectForKey:@"link"];
    _description = [dic objectForKey:@"description"];
    _photo_url = @"";
  }
  
  return self;
}

@end
