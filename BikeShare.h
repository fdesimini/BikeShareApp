//
//  BikeShare.h
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-05.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"

@interface BikeShare : NSObject

@property (strong, nonatomic) HTTPCommunication *http;

@property (strong, nonatomic) NSNumber *stationId;
@property (strong, nonatomic) NSString *stationName;
@property (strong, nonatomic) NSString *statusValue;
@property (strong, nonatomic) NSNumber *availableDocks;
@property (strong, nonatomic) NSNumber *totalDocks;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;

-(void)getUrl;


@end
