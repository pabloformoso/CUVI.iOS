//
//  SQLiteAccess+Curso.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SQLiteAccess+Curso.h"

@implementation SQLiteAccess (Curso)

+ (NSArray *)selectAllClasses {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    NSString *query = @"SELECT * FROM clases;";
    
    NSArray *temp = [[NSArray alloc] initWithArray:[self selectManyRowsWithSQL:query] copyItems:YES];
    //[self selectManyRowsWithSQL:query];
    NSMutableArray *clases = [[NSMutableArray alloc] init];
    
    for (NSDictionary *cls in temp) {
        if (cls) {
            NSLog(@"%@", [cls description]);
        }
    }

#ifndef NDEBUG
    NSLog(@"%s (line:%d) end", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    return clases;
}

@end
