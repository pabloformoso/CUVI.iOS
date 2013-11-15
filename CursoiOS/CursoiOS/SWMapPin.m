//
//  SWMapPin.m
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estadra. All rights reserved.
//

#import "SWMapPin.h"

@implementation SWMapPin

- (id)initWithTitle:(NSString *)aTitle
           subtitle:(NSString *)aSubtitle
     andCoordinates:(CLLocationCoordinate2D)aCoordinate {
  
  self = [super init];
  
  if (self) {
    _title = aTitle;
    _subtitle = aSubtitle;
    _coordinate = aCoordinate;
  }
  
  return self;
}

@end
