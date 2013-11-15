//
//  SWMapPin.h
//  AppCompleta
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estadra. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface SWMapPin : NSObject <MKAnnotation>

- (id)initWithTitle:(NSString *)aTitle
           subtitle:(NSString *)aSubtitle
     andCoordinates:(CLLocationCoordinate2D)aCoordinate;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end
