//
//  ByKVOViewController.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 09/10/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ByKVOViewController.h"
#import "KVOModel.h"

@interface ByKVOViewController ()

@property (nonatomic) KVOModel *kvoModel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ByKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Pass Data By KVO";
    self.kvoModel = [KVOModel new];
    
    [self.kvoModel addObserver:self forKeyPath:@"myArray" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (IBAction)onClickedRequestData:(id)sender {
    [self.resultLabel setText:@"I am waiting for the response"];
    [self.kvoModel requestForSomeData];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"myArray"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resultLabel setText:[NSString stringWithFormat: @"I got the response, now I have an array that has %lu items", self.kvoModel.myArray.count]];
        });
    }
}

@end
