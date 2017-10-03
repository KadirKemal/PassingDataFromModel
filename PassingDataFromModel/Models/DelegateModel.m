//
//  DelegateModel.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "DelegateModel.h"

@implementation DelegateModel

-(void) requestForSomeData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{ // 1
        //do some jobs, for example these jobs take 2 seconds
        sleep(2);
        NSArray *array = [NSArray arrayWithObjects:@1, @"istanbul", @3.14, nil];
        
        if(_delegate){
            //to change something on viewcontroller, we should use main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                [_delegate didReceiveResponse:array];
            });
        }
    });
}

@end
