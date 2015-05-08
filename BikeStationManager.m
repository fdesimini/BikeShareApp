//
//  BikeShareData.m
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-06.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "BikeStationManager.h"
#import "BikeStation.h"
#import "MapViewController.h"


@implementation BikeStationManager

//custom initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.http = [[HTTPCommunication alloc]init];

//        [self getData];
    }
    return self;
}


-(void)getData:(void(^)(NSArray *))success
{
        NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
     [_http retrievURL:url successBlock:^(NSData * response) {
        NSError *error = nil;
        //deserialize the information we get from the api
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        //NSLog(@"%@", data);
         
         if (!error) {

        NSArray *stationResult = [data objectForKey:@"stationBeanList"];
         
//         NSLog(@"%@", stationResult);
         
         //fast enumeration
         self.listOfBikeStationInstances = [[NSMutableArray alloc]init];
         for (NSDictionary *dictionaries in stationResult)
         {
            //storing lat long
            NSNumber *latitude = dictionaries[@"latitude"]; // [dictionaries objectForKey:@"latitude"];
            NSNumber *longitude = dictionaries[@"longitude"];
             NSString *name = dictionaries[@"stationName"];
             
            // Create an Instance of the Bike Staiton Annotation
             BikeStation *bikeStation = [[BikeStation alloc]init];
             
             bikeStation.coordinate = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
             bikeStation.title = name;
             
             [self.listOfBikeStationInstances addObject:bikeStation];
             
             NSLog(@"%@ : (%f, %f)", bikeStation.title, bikeStation.coordinate.longitude, bikeStation.coordinate.latitude);
             NSLog(@"%@", self.listOfBikeStationInstances);
         }
        if (success) {
            success(self.listOfBikeStationInstances);
        }
             
             
             
             
             
             
             
             
             
//            //create an array of objects
//             NSArray *myData = [NSMutableArray arrayWithObjects:latitude,longitude, nil];
//             NSMutableArray *objectsOfObjects = [[NSMutableArray alloc]initWithArray:myData copyItems:YES];
//             //debug this value
//             NSLog(@"%@", objectsOfObjects[0]);
//             NSLog(@"%@", objectsOfObjects[1]);
             //now we annotate
//             CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake([objectsOfObjects [0] floatValue], [objectsOfObjects[1] floatValue]);
//             Annotation *annotation = [[Annotation alloc]init];
//             //pass the value of the annotation coordinate
//             annotation.coordinate = annotationCoordinate;
//             [self.mapView addAnnotation:annotation];
            
         }
         
         
    }];

}


@end
