//
//  SWLocationManager.h
//  Live Access
//
//  Created by Pablo Formoso Estrada on 23/04/12.
//  Copyright (c) 2012 Softwhisper Mobile Dev. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@protocol SWLocationManagerDelegate
@required   
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end

@interface SWLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;  
@property (nonatomic, assign) id delegate;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end
