//
//  ByCallbacksViewController.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ByCallbacksViewController.h"
#import "CallbackModel.h"

@interface ByCallbacksViewController ()

@property (nonatomic) CallbackModel *callbackModel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ByCallbacksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Pass Data By Callback";
    self.callbackModel = [CallbackModel new];
    
}

- (IBAction)onClickedRequestData:(id)sender {
    [self.resultLabel setText:@"I am waiting for the response"];
    
    //we should create a weak reference for self to avoid strong reference cycle
    __weak typeof(self) weakSelf = self;
    
    [self.callbackModel requestForSomeData:10 completion:^(NSArray *arr){
        [weakSelf.resultLabel setText:[NSString stringWithFormat: @"I got the response, now I have an array that has %lu items", arr.count]];
    }];
}



@end
