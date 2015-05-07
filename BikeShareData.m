//
//  BikeShareData.m
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-06.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "BikeShareData.h"
#import "Annotation.h"
#import "MapViewController.h"


@implementation BikeShareData

//custom initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.http = [[HTTPCommunication alloc]init];
    }
    return self;
}

-(void)getDataOnSuccess:(void (^)(NSArray *stations))success
{
        NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
     [self.http retrievURL:url successBlock:^(NSData * response) {
        NSError *error = nil;
        //deserialize the information we get from the api
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        //NSLog(@"%@", data);
        NSArray *stationResult = [data objectForKey:@"stationBeanList"];
//     NSLog(@"%@", stationResult);
         
         NSMutableArray *listOfAnnotations = [[NSMutableArray alloc] init];
         //fast enumeration
         for (NSDictionary *dictionaries in stationResult)
         {
            NSNumber *latitude = dictionaries[@"latitude"];
            NSNumber *longitude = dictionaries[@"longitude"];
            //create an array of objects
//             NSArray *myData = [NSMutableArray arrayWithObjects:latitude,longitude, nil];
//             NSMutableArray *objectsOfObjects = [[NSMutableArray alloc]initWithArray:myData copyItems:YES];
//             //debug this value
//             NSLog(@"%@", objectsOfObjects[0]);
//             NSLog(@"%@", objectsOfObjects[1]);

          //now we annotate
             CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
             Annotation *annotation = [[Annotation alloc]init];
             //pass the value of the annotation coordinate
             annotation.coordinate = annotationCoordinate;
             [listOfAnnotations addObject:annotation];
         }
         
         if (success)
         {
             success(listOfAnnotations);
         }
    }];
}


@end
