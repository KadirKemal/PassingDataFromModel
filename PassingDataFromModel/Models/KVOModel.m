//
//  KVOModel.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 09/10/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "KVOModel.h"

@implementation KVOModel

-(void) requestForSomeData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        sleep(2);
        weakSelf.myArray = [NSArray arrayWithObjects:@1, @"istanbul", @3.14, nil];        
    });
}

@end
