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
    
    // this is where we will initilialize the mapView Object and add the subview
    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   [self.view addSubview:_mapView];
   
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
      
    if (IS_OS_8_OR_LATER)
    {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;

}

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
