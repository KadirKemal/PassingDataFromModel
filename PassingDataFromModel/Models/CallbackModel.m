//
//  CallbackModel.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "CallbackModel.h"

@implementation CallbackModel

-(void) requestForSomeData:(int) someParameter completion:(void(^)(NSArray *))callbackBlock{
    [self performSelectorInBackground:@selector(backgroundJob:) withObject:callbackBlock];
}

-(void) backgroundJob:(void(^)(NSArray *))callbackBlock{
    //do some jobs, for example these jobs take 2 seconds
    sleep(2);
    
    NSArray *array = [NSArray arrayWithObjects:@1, @"istanbul", @3.14, nil];
    
    //to change something on viewcontroller, we should use main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        callbackBlock(array);
    });
    
}



@end
