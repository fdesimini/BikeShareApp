//
//  MapViewController.h
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-04.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPCommunication.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

//implement HTTPCommunication here

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;


@end
