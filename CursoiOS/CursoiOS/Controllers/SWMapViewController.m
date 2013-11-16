//
//  SWMapViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWMapPin.h"
#import "SWMapViewController.h"

@interface SWMapViewController ()
@property (nonatomic,strong) SWLocationManager *manager;
@property (nonatomic,strong) CLLocation *lastLocation;
@end

@implementation SWMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _manager = [[SWLocationManager alloc] init];
  [_manager setDelegate:self];
  [_manager.locationManager setActivityType:CLActivityTypeFitness];
  
}

-(void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [_manager.locationManager startUpdatingLocation];
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [self dropPins];
}

- (void)dropPins {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif

  SWMapPin *p1 = [[SWMapPin alloc] initWithTitle:@"pin1"
                                        subtitle:@"sub pin1"
                                  andCoordinates:CLLocationCoordinate2DMake(42.171115, -8.685637)];
  
  SWMapPin *p2 = [[SWMapPin alloc] initWithTitle:@"pin2"
                                        subtitle:@"sub pin2"
                                  andCoordinates:CLLocationCoordinate2DMake(42.172100, -8.685600)];
  
  SWMapPin *p3 = [[SWMapPin alloc] initWithTitle:@"pin1"
                                        subtitle:@"sub pin1"
                                  andCoordinates:CLLocationCoordinate2DMake(42.170000, -8.685656)];
  
  
  [_mapView addAnnotations:@[p1,p2,p3]];
  
  [self drawPolyline];
}

- (void)drawPolyline {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSInteger numberOfPoints = 3;
  
  CLLocationCoordinate2D coordinates[numberOfPoints];
  
  CLLocation *location1 = [[CLLocation alloc] initWithLatitude:42.171115
                                                     longitude:-8.685637];
  CLLocationCoordinate2D coordinate1 = location1.coordinate;
  coordinates[0] = coordinate1;
  
  CLLocation *location2 = [[CLLocation alloc] initWithLatitude:42.172100
                                                     longitude:-8.685600];
  CLLocationCoordinate2D coordinate2 = location2.coordinate;
  coordinates[1] = coordinate2;
  
  CLLocation *location3 = [[CLLocation alloc] initWithLatitude:42.170000
                                                     longitude:-8.685656];
  CLLocationCoordinate2D coordinate3 = location3.coordinate;
  coordinates[2] = coordinate3;
  
  MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:numberOfPoints];
  
  [_mapView addOverlay:polyline];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
  [polylineView setStrokeColor:[UIColor blackColor]];
  [polylineView setLineWidth:5.0f];
  
  return polylineView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationUpdate:(CLLocation *)location {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _lastLocation = location;
  
  MKCoordinateRegion region;
  MKCoordinateSpan span;
  
  span.latitudeDelta = 0.005;
  span.longitudeDelta = 0.005;
  
  region.span = span;
  region.center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
  
  [_mapView setRegion:region animated:YES];
  
}

- (void)locationError:(NSError *)error {
  
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [_manager.locationManager stopUpdatingLocation];
}

@end
