//
//  SWClasesXmlService.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 08/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "BaseXmlParser.h"

@interface SWClasesXmlService : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (void)getClassesForController:(id)aController;

@end
