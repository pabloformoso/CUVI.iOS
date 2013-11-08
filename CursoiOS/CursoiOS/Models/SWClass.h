//
//  SWClass.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClass : NSObject

- (id)initWithDBDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int classId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;

@end
