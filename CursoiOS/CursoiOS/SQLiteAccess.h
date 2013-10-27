//
//  SQLiteAccess.h
//  IceSlide
//
//  Created by Bill Dudney on 3/11/08.
//  Copyright 2008 Gala Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLiteAccess : NSObject {
}

+ (NSString *)selectOneValueSQL:(NSString *)sql;
+ (NSArray *)selectManyValuesWithSQL:(NSString *)sql;
+ (NSDictionary *)selectOneRowWithSQL:(NSString *)sql;
+ (NSArray *)selectManyRowsWithSQL:(NSString *)sql;
+ (NSNumber *)insertWithSQL:(NSString *)sql;

+ (void)alterWithSQL:(NSString *)sql;
+ (void)updateWithSQL:(NSString *)sql;
+ (void)deleteWithSQL:(NSString *)sql;

@end
