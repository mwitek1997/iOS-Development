//
//  ViewController.m
//  Peer Review Asst2
//
//  Created by Mathew on 5/14/18.
//  Copyright © 2018 Mathew. All rights reserved.
//

#import "ViewController.h"

double convertUnitOneToUnitTwo(double unitOneValue){
    
    double unitTwoValue;
    
    unitTwoValue = unitOneValue/12;
    
    return unitTwoValue;
    
}

double convertUnitOneToUnitThree(double unitOneValue){
    
    double unitThreeValue;
    
    unitThreeValue = unitOneValue * 0.027778;
    
    return unitThreeValue;
    
}

double convertUnitOneToUnitFour(double unitOneValue){
    
    double unitFourValue;
    
    unitFourValue = unitOneValue * 0.0254;
    
    return unitFourValue;
    
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputFeed;


@end

@implementation ViewController

- (IBAction)updateButton:(id)sender {
    
    NSMutableString *buf = [NSMutableString new];
    
    double userInput = [self.inputField.text doubleValue];
    
    if(self.segmentController.selectedSegmentIndex == 0){
        
        double unitTwoValue = convertUnitOneToUnitTwo(userInput);
        
        [buf appendString: [@(unitTwoValue) stringValue]];
        
    }else if(self.segmentController.selectedSegmentIndex == 1){
        
        double unitThreeValue = convertUnitOneToUnitThree(userInput);
        
        [buf appendString: [@(unitThreeValue) stringValue]];
        
    }else{
        
        double unitFourValue = convertUnitOneToUnitFour(userInput);
        
        [buf appendString: [@(unitFourValue) stringValue]];
        
    }

    self.outputFeed.text = buf;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
