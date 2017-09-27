//
//  ByNotificationViewController.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 27/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ByNotificationViewController.h"
#import "NotificationModel.h"

@interface ByNotificationViewController ()

@property (nonatomic) NotificationModel *notificationModel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ByNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Pass Data By Notification";
    self.notificationModel = [NotificationModel new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:POST_NOTIFICATION_NAME
                                               object:nil];
}

- (IBAction)onClickedRequestData:(id)sender {
    [self.resultLabel setText:@"I am waiting for the response"];
    [self.notificationModel requestForSomeData];
}

- (void) receiveNotification:(NSNotification *) notification{
    if ([[notification name] isEqualToString:POST_NOTIFICATION_NAME]){
        NotificationModel *model = notification.object;
        
        [self.resultLabel setText:[NSString stringWithFormat: @"I got the response, now I have an array that has %lu items", model.myArray.count]];
    }
}


@end
