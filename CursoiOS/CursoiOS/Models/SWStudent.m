//
//  SWStudent.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 09/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWStudent.h"

@implementation SWStudent

- (id)initWithJsonDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [super init];

  if (self) {
    _studentId = [[dic valueForKey:@"id"] integerValue];
    _name = [dic objectForKey:@"name"];
    _lastname = [dic objectForKey:@"lastname"];
    _avatar = [dic objectForKey:@"image_url"];
    _email = [dic objectForKey:@"email"];
    _city = [dic objectForKey:@"city"];
  }
  
  return self;
}

- (NSURL *)getAvatarURL {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  //"image_url":"/system/stundents/avatars/000/000/001/original/IMG_2617.JPG?1383951928"
  NSString *urlString = [NSString stringWithFormat:@"http://curso.softwhisper.es%@", _avatar];
  return [NSURL URLWithString:urlString];
}

@end
