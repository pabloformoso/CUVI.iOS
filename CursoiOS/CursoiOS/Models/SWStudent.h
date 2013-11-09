//
//  SWStudent.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 09/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWStudent : NSObject

- (id)initWithJsonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int studentId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *city;

- (NSURL *)getAvatarURL;

@end
