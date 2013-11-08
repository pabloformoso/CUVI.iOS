//
//  SWClass.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWClass.h"

@implementation SWClass

- (id)initWithDBDictionary:(NSDictionary *)dic {
  /*
   descripcion = "Persistencia de .... r Defaults";
   fin = "22:00";
   inicio = "17:00";
   nombre = "iOS Sesion 3";
   profesor = "Pablo Formoso";
   */
  self = [super init];
  
  if (self) {
    _classId = rand();
    _name = [dic objectForKey:@"nombre"];
    _description = [dic objectForKey:@"descripcion"];
    _startDate = [NSDate date]; //Transformar la fecha con el string
    _endDate = [NSDate date];   // de la hora que viene en el dic
  }
  
  return self;
}

- (id)initWithJsonDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [super init];
  
  if (self) {
    _classId = [[dic valueForKey:@"id"] integerValue];
    _name = [dic objectForKey:@"name"];
    _description = [dic objectForKey:@"description"];
    _startDate = [NSDate date]; //Transformar la fecha con el string
    _endDate = [NSDate date];   // de la hora que viene en el dic
  }
  
  return self;
}

- (id)initWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    self = [[SWClass alloc] init];
    
    if (self) {
        _classId = [coder decodeIntForKey:@"class_id"];
        _name = [coder decodeObjectForKey:@"class_name"];
        _startDate = [coder decodeObjectForKey:@"start_date"];
        _endDate = [coder decodeObjectForKey:@"end_date"];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif

    [coder encodeInt:_classId forKey:@"class_id"];
    [coder encodeObject:_name forKey:@"class_name"];
    [coder encodeObject:_startDate forKey:@"start_date"];
    [coder encodeObject:_endDate forKey:@"end_date"];
}



@end
