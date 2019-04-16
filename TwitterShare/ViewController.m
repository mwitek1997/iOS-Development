//
//  ViewController.m
//  TwitterShare
//
//  Created by Mathew on 6/4/18.
//  Copyright © 2018 Mathew. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void) configureTweetTeextView;
- (void) showAlertMessage:(NSString *) myMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTweetTeextView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showAlertMessage:(NSString *) myMessage{
    
    UIAlertController *alertController;
    
    alertController = [UIAlertController alertControllerWithTitle:@"SocialShare" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (IBAction)showShareAction:(id)sender {
    
    if([self.tweetTextView isFirstResponder]){
        
        [self.tweetTextView resignFirstResponder];
        
    }
    
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"Share" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                                  
                                  ^(UIAlertAction *action){
                                      
                                      if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
                                          
                                          SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                                          
                                          //Tweet out the tweet.
                                          
                                          if([self.tweetTextView.text length] < 140){
                                              
                                              [twitterVC setInitialText:self.tweetTextView.text];
                                              
                                          }else{
                                              
                                              NSString *shortText = [self.tweetTextView.text substringToIndex:140];
                                              [twitterVC setInitialText:shortText];
                                              
                                          }
                                          
                                          [self presentViewController:twitterVC animated: YES completion: nil];
                                          
                                      }else{
                                          
                                          //raise some kind of objection.
                                          
                                          [self showAlertMessage:@"You are not signed in to Twitter"];
                                          
                                      }
                                      
                                  }
                                  
                                ];
    
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Post to Facebook" style:UIAlertActionStyleDefault handler:
^(UIAlertAction *action){
        
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            
            SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [facebookVC setInitialText:self.tweetTextView.text];
            [self presentViewController: facebookVC animated: YES completion: nil];
            
        }else{
            
            [self showAlertMessage:@"Please sign into Facebook."];
            
        }
        
    }];
    
    UIAlertAction *moreAction = [UIAlertAction actionWithTitle:@"More" style:UIAlertActionStyleDefault handler:
                                 ^(UIAlertAction *action){
                                     
                                     UIActivityViewController *moreVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];
                                     
                                     [self presentViewController: moreVC animated:YES completion:nil];
                                     
                                 }];
    
    [actionController addAction:tweetAction];
    [actionController addAction:facebookAction];
    [actionController addAction:moreAction];
    [actionController addAction:cancelAction];
    
    [self presentViewController: actionController animated:YES completion:nil];
    
}

- (void) configureTweetTeextView{
    
    self.tweetTextView.layer.backgroundColor =[UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite: 0 alpha:0.5].CGColor;
    self.tweetTextView.layer.borderWidth = 2.0;
    
}

@end
