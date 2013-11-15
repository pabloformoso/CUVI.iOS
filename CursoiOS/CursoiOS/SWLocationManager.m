//
//  SWLocationManager.m
//  Live Access
//
//  Created by Pablo Formoso Estrada on 23/04/12.
//  Copyright (c) 2012 Softwhisper Mobile Dev. All rights reserved.
//

#import "SWLocationManager.h"

@implementation SWLocationManager

@synthesize locationManager;
@synthesize delegate;

- (id) init {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
    self = [super init];
    
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
    if ((newLocation.coordinate.latitude > oldLocation.coordinate.latitude + 0.002) ||
        (newLocation.coordinate.latitude < oldLocation.coordinate.latitude - 0.002) ||
        (newLocation.coordinate.longitude > oldLocation.coordinate.longitude + 0.002) ||
        (newLocation.coordinate.longitude < oldLocation.coordinate.longitude - 0.002)){
        [self.delegate locationUpdate:newLocation];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
	[self.delegate locationError:error];
}

@end
