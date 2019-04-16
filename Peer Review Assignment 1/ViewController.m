//
//  ViewController.m
//  Peer Review Assignment 1
//
//  Created by Mathew on 5/12/18.
//  Copyright © 2018 Mathew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testButtonTapped:(id)sender {
    
    self.testLabel.text = @"It Worked!";
    
}


@end
