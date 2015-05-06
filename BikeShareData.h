//
//  BikeShareData.h
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-06.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "HTTPCommunication.h"

@interface BikeShareData : HTTPCommunication

@property (strong, nonatomic) HTTPCommunication *http;

@property (strong, nonatomic) NSNumber *stationId;
@property (strong, nonatomic) NSString *stationName;
@property (strong, nonatomic) NSString *statusValue;
@property (strong, nonatomic) NSNumber *availableDocks;
@property (strong, nonatomic) NSNumber *totalDocks;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;

-(void)getData:(id)sender;

@end
