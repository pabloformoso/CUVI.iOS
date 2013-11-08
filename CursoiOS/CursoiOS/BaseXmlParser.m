//
//  BaseXmlParser.m
//  iVoz
//
//  Created by Pablo Formoso Estrada on 07/09/11.
//  Copyright 2011 Pablo Formoso. All rights reserved.
//

#import "BaseXmlParser.h"

@implementation BaseXmlParser

- (id) init {
	self = [super init];
	
	return self;
}


// Clear the contents of the collected inter-element text.
- (void) clearContentsOfElement {
	_contentsOfElement = [[NSMutableString alloc] init];
}


// Start the parsing process
- (void) parseDocument:(NSData *) data {
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	
	[parser setDelegate:self];
    
	// Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
	[parser setShouldProcessNamespaces:YES];
	[parser setShouldReportNamespacePrefixes:NO];
	[parser setShouldResolveExternalEntities:NO];
	
	[parser parse];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
#ifndef NDEBUG
	NSLog(@"%@ parserErrorOccurred:(%@)", NSStringFromSelector(_cmd), [parseError description]);
#endif	
}

// Handle the receipt of intraelement text
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[_contentsOfElement appendString:[self trim:string]];
}


//  Trim leading and trailing spaces
- (NSString *)trim:(NSString *)inStr {
	return [inStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
