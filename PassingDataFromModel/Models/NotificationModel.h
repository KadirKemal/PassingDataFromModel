//
//  NotificationModel.h
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define POST_NOTIFICATION_NAME @"NotificationName"

@interface NotificationModel : NSObject

@property (nonatomic) NSArray* myArray;
-(void) requestForSomeData;

@end
