//
//  MapViewController.m
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-04.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.tabbar image imagwithrendering
    UIImage *mapIcon = [UIImage imageNamed:@"map_icon_30"];
    [self.tabBarItem.image = mapIcon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // this is where we will initilialize the mapView Object and add the subview
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   [self.view addSubview:_mapView];
   
    //This is where we focus on the users location
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
      
    if (IS_OS_8_OR_LATER)
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    //This reports all movement
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    //defines the accuracy of the location you want
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;

    // Set Region
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(43.642566, -79.387057), span);
    
    [self.mapView setRegion:region];
    
    //NEED this to get annotations
    self.bikeStationManager = [[BikeStationManager alloc]init];
    
    [self.bikeStationManager getData:^(NSArray *listOfStationsAgain) {
        
        for (BikeStation *bikeStation in listOfStationsAgain) {

            [self.mapView addAnnotation:bikeStation];
        }
        
    }];
    
//    //Annotations
//    CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake(35.6833, 139.6833);
//    //Configure annotation
//    self.annotation.coordinate = annotationCoordinate;
//    [self.mapView addAnnotation:self.annotation];
//    //configure annotation
//    [self.mapView setCenterCoordinate:self.annotation.coordinate animated:YES];
  

    
}



//This implementation allows you to zoom in on the map after launch
//didAddAnnotationViews is one of the delegate methods of the MKMapViewDelegate
//
//-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
//{
//    MKAnnotationView *annotationView = [views objectAtIndex:0];
//    id<MKAnnotation> mp=[annotationView annotation];
//    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance([mp coordinate], 250, 250);
//    
//    [mapView setRegion:region animated:YES];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
