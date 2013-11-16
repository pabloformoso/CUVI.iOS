//
//  SWMapViewController.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "SWLocationManager.h"

@interface SWMapViewController :
 UIViewController <SWLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@end
