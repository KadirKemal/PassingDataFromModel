//
//  NotificationModel.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "NotificationModel.h"

@implementation NotificationModel

-(void) requestForSomeData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{ // 1
        //do some jobs, for example these jobs take 2 seconds
        sleep(2);
        _myArray = [NSArray arrayWithObjects:@1, @"istanbul", @3.14, nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:POST_NOTIFICATION_NAME object:self];
        });
    });
}

@end
