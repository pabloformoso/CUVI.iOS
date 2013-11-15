//
//  SWPostResourceService.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWResource;
#import <Foundation/Foundation.h>

@interface SWPostResourceService : NSObject

- (void)createResource:(SWResource *)res fromController:(id)aController;

@end
