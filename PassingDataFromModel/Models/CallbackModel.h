//
//  CallbackModel.h
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CallbackModel : NSObject

-(void) requestForSomeData:(int) someParameter completion:(void(^)(NSArray *))callbackBlock;

@end
