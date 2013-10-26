//
//  SWClass.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWClass.h"

@implementation SWClass

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
