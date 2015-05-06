//
//  BikeShareData.m
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-06.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "BikeShareData.h"

@implementation BikeShareData

//custom initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        _http = [[HTTPCommunication alloc]init];
       [self getData];
    }
    return self;
}

-(void)getData
{
        NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
     [_http retrievURL:url successBlock:^(NSData * response) {
        NSError *error = nil;
        //deserialize the information we get from the api
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSLog(@"%@", data);
        /*if (!error) {
            NSDictionary *value = data [@"stationBeanList"];
            if (value && value[@"stationName"]) {
                _stationId = value[@"id"];
                //update UI with the joke
                //[self.jokeLabel setText:value[@"joke"]];
            }
        }*/
    }];

}


@end
