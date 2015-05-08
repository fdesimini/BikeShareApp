//
//  Annotation.h
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-06.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BikeStation : NSObject <MKAnnotation>

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy) NSString *title;


@end
