//
//  SWMapViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "SWMapViewController.h"

@interface SWMapViewController ()

@end

@implementation SWMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

/* Creación de Pins
 SWMapPin *p1 = [[SWMapPin alloc] initWithTitle:@"pin1"
 subtitle:@"sub pin1"
 andCoordinates:CLLocationCoordinate2DMake(43.3222746, -8.403070)];
*/

/* Creación de puntos 
 NSInteger numberOfPoints = 3;
 
 CLLocationCoordinate2D coordinates[numberOfPoints];
 
 CLLocation *location1 = [[CLLocation alloc] initWithLatitude:43.3212546
 longitude:-8.414570];
 CLLocationCoordinate2D coordinate1 = location1.coordinate;
 coordinates[0] = coordinate1;
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationUpdate:(CLLocation *)location {
  
}

- (void)locationError:(NSError *)error {
  
}

@end
