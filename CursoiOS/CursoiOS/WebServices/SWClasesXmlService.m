//
//  SWClasesXmlService.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 08/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWClass.h"
#import "SWClasesXmlService.h"

@interface SWClasesXmlService ()

@property (nonatomic, strong) NSMutableArray *classes;
@property (nonatomic, strong) NSMutableData *wipData;
@property (nonatomic, strong) SWClass *tmpClass;
@property (nonatomic, assign) id controller;

@end

@implementation SWClasesXmlService

- (void)getClassesForController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  // http://192.168.1.20:3000/aecomo_classes.xml
  
  NSString *urlString = @"http://192.168.1.20:3000/aecomo_classes.xml";
  NSURL *url = [NSURL URLWithString:urlString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url
                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                       timeoutInterval:60];
  
  
  [NSURLConnection connectionWithRequest:request delegate:self];
  
  return;
}

// Recivimos la primera respusta del server
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    int status = [res statusCode];
    
    if ((status >= 200) && (status <= 300)) {
      _wipData = nil;
      _wipData = [[NSMutableData alloc] init];
    } else {
      NSLog(@"Error con la conexión");
    }
  }
  
}

// Agregamos los datos descargados
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [_wipData appendData:data];
}

// En caso de error
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  NSLog(@"Fallo: %@", [error localizedDescription]);
  
  if ([_controller respondsToSelector:@selector(updateViewFailed)]) {
    [_controller performSelector:@selector(updateViewFailed)];
  }
}


// Cuando termina la conexión
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self parseDocument:_wipData];
  
  if ([_controller respondsToSelector:@selector(updateView:)]) {
    [_controller performSelector:@selector(updateView:) withObject:_classes];
  }
}

#pragma mark - XMLParserDelegate
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
  
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([elementName isEqualToString:@"aecomo-classes"]) {
    _classes = [[NSMutableArray alloc] init];
  } else if ([elementName isEqualToString:@"aecomo-class"]) {
    if (_tmpClass != nil) {
      _tmpClass = nil;
    }
    _tmpClass = [[SWClass alloc] init];
  }
  
  [self clearContentsOfElement];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

#ifndef NDEBUG
  NSLog(@"%s (line:%d) %@ - %@", __PRETTY_FUNCTION__, __LINE__, elementName, _contentsOfElement);
#endif
  
  if ([elementName isEqualToString:@"id"]) {
    [_tmpClass setClassId:[_contentsOfElement integerValue]];
    
  } else if ([elementName isEqualToString:@"name"]) {
    [_tmpClass setName:_contentsOfElement];
    
  } else if ([elementName isEqualToString:@"description"]) {
    [_tmpClass setDescription:_contentsOfElement];
    
  } else if ([elementName isEqualToString:@"aecomo-class"]) {
    [_tmpClass setStartDate:[NSDate date]];
    [_tmpClass setEndDate:[NSDate date]];
    [_classes addObject:_tmpClass];
  }

  [self clearContentsOfElement];
}




@end
