//
//  ViewController.m
//  Asst 4
//
//  Created by Mathew on 6/3/18.
//  Copyright © 2018 Mathew. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"


@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req; // This is a property to hold our object.

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;


@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;


@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;


@end

@implementation ViewController

- (IBAction)calculateButtonTapped:(id)sender {
    
    self.calculateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationA.text;
    NSString *destC = self.endLocationA.text;
    
    NSArray *dests = @[destA, destB, destC];
    
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^void(NSArray *responces) {
        
        ViewController *strongSelf = weakSelf;
        if(!strongSelf) return;
        
        
        NSNull *badResult = [NSNull null];
        
        if(responces[1] != badResult){
            
            double num2 = ([responces[1] floatValue]/1000.0);
            NSString *y = [NSString stringWithFormat:@"%.2f km", num2];
            
            strongSelf.distanceB.text = y;
            
            
        }else{
            
            strongSelf.distanceB.text = @"Error";
            
        }
        
        if(responces[0] != badResult){
            
            double num = ([responces[0] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km", num];
            
            strongSelf.distanceA.text = x;
            
            
        }else{
            
            strongSelf.distanceA.text = @"Error";
            
        }

        
        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
        
    };
    
    [self.req start];
    
}


@end
