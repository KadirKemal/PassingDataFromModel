//
//  DelegateModel.h
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DelegateModelDelegate

-(void) didReceiveResponse:(NSArray *) arr;

@end

@interface DelegateModel : NSObject

@property(weak) id<DelegateModelDelegate> delegate;

-(void) requestForSomeData;

@end
