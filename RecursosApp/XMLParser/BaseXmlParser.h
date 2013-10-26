//
//  BaseXmlParser.h
//  iVoz
//
//  Created by Pablo Formoso Estrada on 07/09/11.
//  Copyright 2011 Pablo Formoso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseXmlParser : NSObject <NSXMLParserDelegate> {
	NSMutableString	*_contentsOfElement;
}

- (id) init;
- (void) parseDocument:(NSData *)data;
- (void) clearContentsOfElement;

@end
