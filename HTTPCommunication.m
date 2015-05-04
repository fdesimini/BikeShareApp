//
//  HTTPCommunication.m
//  BikeShareApp
//
//  Created by Frank Desimini on 2015-05-04.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

#import "HTTPCommunication.h"

@implementation HTTPCommunication

//implement retrieve URL
-(void)retrievURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock
{
    // persisting given successBlock for calling it later
    self.successBlock = successBlock;
    
    // creating the request using the given url
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
   
    // creating a session using the default configuration and setting our instance as delegate (defining the behaviour of this session)
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];

    // preparing the download task
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    // establising the connection
    [task resume];
    
}

//Conform to the protocol
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
// Getting the downloaded data from the local storage
    NSData *data = [NSData dataWithContentsOfURL:location];

// ensure that you call the successBlock from the main thread by using dispatch queues
    dispatch_async(dispatch_get_main_queue(), ^{
// calling the block stored before as a callback
        self.successBlock(data);
    });
    

}
@end
