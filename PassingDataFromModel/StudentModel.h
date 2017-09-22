//
//  StudentModel.h
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 22/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSMutableArray<NSNumber *> *testScores;

@end
