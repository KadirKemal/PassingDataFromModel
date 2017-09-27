//
//  ByDelegateViewController.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ByDelegateViewController.h"
#import "DelegateModel.h"

@interface ByDelegateViewController ()<DelegateModelDelegate>

@property (nonatomic) DelegateModel *delegateModel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ByDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Pass Data By Delegate";
    self.delegateModel = [DelegateModel new];
    [self.delegateModel setDelegate:self];
}

- (IBAction)onClickedRequestData:(id)sender {
    [self.resultLabel setText:@"I am waiting for the response"];
    [self.delegateModel requestForSomeData];
}

-(void)didReceiveResponse:(NSArray *)arr{
    [self.resultLabel setText:[NSString stringWithFormat: @"I got the response, now I have an array that has %lu items", arr.count]];
}


@end
