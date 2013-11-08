//
//  SQLiteAccess.m
//  Recipes
//
//  Created by Bill Dudney on 3/11/08.
//  Copyright 2008 Gala Factory. All rights reserved.
//
//  Upadted to ARC on 27/10/2013


#import "SQLiteAccess.h"
#import <sqlite3.h>

@implementation SQLiteAccess

static int singleRowCallback(void *queryValuesVP, int columnCount, char **values, char **columnNames) {
    NSMutableDictionary *queryValues = (__bridge NSMutableDictionary *)queryValuesVP;
    int i;
    for(i=0; i<columnCount; i++) {
        [queryValues setObject:values[i] ? [NSString stringWithUTF8String:values[i]] : [NSNull null]
                        forKey:[NSString stringWithUTF8String:columnNames[i]]];
    }
    return 0;
}

static int multipleRowCallback(void *queryValuesVP, int columnCount, char **values, char **columnNames) {
    NSMutableArray *queryValues = (__bridge NSMutableArray *)queryValuesVP;
    NSMutableDictionary *individualQueryValues = [NSMutableDictionary dictionary];
    int i;
    for(i=0; i<columnCount; i++) {
        [individualQueryValues setObject:values[i] ? [NSString stringWithUTF8String:values[i]] : [NSNull null]
                                  forKey:[NSString stringWithUTF8String:columnNames[i]]];
    }
    [queryValues addObject:[NSDictionary dictionaryWithDictionary:individualQueryValues]];
    return 0;
}

+ (NSString *)pathToDB {
    
    NSString *dbName = @"db";
    NSString *originalDBPath = [[NSBundle mainBundle] pathForResource:dbName ofType:@"sqlite"];
    
    NSString *path = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *appSupportDir = [paths objectAtIndex:0];
    NSString *dbNameDir = [NSString stringWithFormat:@"%@", appSupportDir];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    BOOL dirExists = [fileManager fileExistsAtPath:dbNameDir isDirectory:&isDir];
    
    NSString *dbPath = [NSString stringWithFormat:@"%@/%@.db", dbNameDir, dbName];
	
    if(dirExists && isDir) {
        BOOL dbExists = [fileManager fileExistsAtPath:dbPath];
        if(!dbExists) {
            NSError *error = nil;
            BOOL success = [fileManager copyItemAtPath:originalDBPath toPath:dbPath error:&error];
            if(!success) {
                NSLog(@"error = %@", error);
            } else {
                path = dbPath;
            }
        } else {
            path = dbPath;
        }
        
    } else if(!dirExists) {
        NSError *error = nil;
        BOOL success = [fileManager createDirectoryAtPath:dbNameDir withIntermediateDirectories:YES attributes:nil error:nil];
        
        if(!success) {
            NSLog(@"failed to create dir");
        }
        success = [fileManager copyItemAtPath:originalDBPath toPath:dbPath error:&error];
        if(!success) {
            NSLog(@"error = %@", error);
        } else {
            path = dbPath;
        }
    }
  
    return path;
}

+ (NSNumber *)executeSQL:(NSString *)sql withCallback:(void *)callbackFunction context:(id)contextObject {
    NSString *path = [self pathToDB];
    sqlite3 *db = NULL;
    int rc = SQLITE_OK;
    NSInteger lastRowId = 0;
    rc = sqlite3_open([path UTF8String], &db);
    if(SQLITE_OK != rc) {
        NSLog(@"Can't open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        return nil;
    } else {
        char *zErrMsg = NULL;
        rc = sqlite3_exec(db, [sql UTF8String], callbackFunction, (__bridge void*)contextObject, &zErrMsg);
        if(SQLITE_OK != rc) {
            NSLog(@"Can't run query '%@' error message: %s\n", sql, sqlite3_errmsg(db));
            sqlite3_free(zErrMsg);
        }
        lastRowId = sqlite3_last_insert_rowid(db);
        sqlite3_close(db);
    }
    NSNumber *lastInsertRowId = nil;
    if(0 != lastRowId) {
        lastInsertRowId = [NSNumber numberWithInteger:lastRowId];
    }
    return lastInsertRowId;
}

+ (NSString *)selectOneValueSQL:(NSString *)sql {
    
    NSMutableDictionary *queryValues = [NSMutableDictionary dictionary];
    [self executeSQL:sql withCallback:singleRowCallback context:queryValues];
    NSString *value = nil;
    if([queryValues count] == 1) {
        value = [[queryValues objectEnumerator] nextObject];
    }

	value = [value stringByReplacingOccurrencesOfString:@"√°" withString:@"á"];
	value = [value stringByReplacingOccurrencesOfString:@"√©" withString:@"é"];	
	value = [value stringByReplacingOccurrencesOfString:@"√≠" withString:@"í"];	
	value = [value stringByReplacingOccurrencesOfString:@"√≥" withString:@"ó"];		
	value = [value stringByReplacingOccurrencesOfString:@"√∫" withString:@"ú"];		
	value = [value stringByReplacingOccurrencesOfString:@"√±" withString:@"ñ"];	
	value = [value stringByReplacingOccurrencesOfString:@"√ë" withString:@"Ñ"];	
	
    return value;
}

+ (NSArray *)selectManyValuesWithSQL:(NSString *)sql {
    
    NSMutableArray *queryValues = [NSMutableArray array];
    [self executeSQL:sql withCallback:multipleRowCallback context:queryValues];
    NSMutableArray *values = [NSMutableArray array];
	
    for(NSDictionary *dict in queryValues) {
        [values addObject:[[dict objectEnumerator] nextObject]];
    }
    
    return values;
}

+ (NSDictionary *)selectOneRowWithSQL:(NSString *)sql {
    
    NSMutableDictionary *queryValues = [NSMutableDictionary dictionary];
    [self executeSQL:sql withCallback:singleRowCallback context:queryValues];
    
    return [NSDictionary dictionaryWithDictionary:queryValues];
}

+ (NSArray *)selectManyRowsWithSQL:(NSString *)sql {

    NSMutableArray *queryValues = [[NSMutableArray alloc] init];
    [self executeSQL:sql withCallback:multipleRowCallback context:queryValues];
  
    return [[NSArray alloc] initWithArray:queryValues];
}

+ (NSNumber *)insertWithSQL:(NSString *)sql {
    
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    return [self executeSQL:sql withCallback:NULL context:NULL];
}

+ (void)updateWithSQL:(NSString *)sql {
  
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    [self executeSQL:sql withCallback:NULL context:nil];
}

+ (void)deleteWithSQL:(NSString *)sql {
    
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    [self executeSQL:sql withCallback:NULL context:nil];
}

+ (void)alterWithSQL:(NSString *)sql {
    
    sql = [NSString stringWithFormat:@"BEGIN TRANSACTION; %@; COMMIT TRANSACTION;", sql];
    [self executeSQL:sql withCallback:NULL context:nil];    
}

@end
