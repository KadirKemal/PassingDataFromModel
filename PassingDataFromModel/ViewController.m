//
//  ViewController.m
//  PassingDataFromModel
//
//  Created by Kadir Kemal Dursun on 22/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"

@interface ViewController ()

@property StudentModel *student1;
@property StudentModel *student2;

@end

@implementation ViewController

static void *student1Context = &student1Context;
static void *student2Context = &student2Context;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _student1 = [StudentModel new];
    [_student1 addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student1Context];
    [_student1 addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student1Context];
    [_student1 addObserver:self forKeyPath:@"testScores" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student1Context];
    
    _student2 = [StudentModel new];
    [_student2 addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student2Context];
    [_student2 addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student2Context];
    [_student2 addObserver:self forKeyPath:@"testScores" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:student2Context];
    
    
    
    _student1.firstName = @"George";
    _student2.firstName = @"Alice";
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if(context == student1Context){
        if ([keyPath isEqualToString:@"firstName"]) {
            NSLog(@"First name of student 1 was changed. Old value: %@, new value: %@", change[@"old"], change[@"new"]);
            //NSLog(@"%@", change);
        }
    }
    else if(context == student2Context){
        if ([keyPath isEqualToString:@"firstName"]) {
            NSLog(@"First name of student 2 was changed. Old value: %@, new value: %@", change[@"old"], change[@"new"]);
            //NSLog(@"%@", change);
        }
    }
    
}


@end
