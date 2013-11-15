//
//  SWResource.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWResource : NSObject

- (id)initWithJSonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int recursoId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *photo_url;

@end
