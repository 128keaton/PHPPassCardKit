//
//  ThirdViewController.m
//  BitTest
//
//  Created by Keaton Burleson on 10/4/12.
//  Copyright (c) 2012 Keaton Burleson. All rights reserved.
//
#import <PassKit/PassKit.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label, webView, spinny;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)generate:(id)sender{
 
    [spinny startAnimating];
    NSString *namete = label.text;
    NSString *urlAddress = [NSString stringWithFormat:@"http://pass.keatonburleson.com/gen.php?name=%@", namete];
    
    //Create a URL object.
    NSURL *url2 = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url2];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
    [NSTimer scheduledTimerWithTimeInterval:21.5 target:self selector:@selector(pass:) userInfo:nil repeats:NO];
    
    
    
}
-(IBAction)hideKB:(id)sender{
    [sender resignFirstResponder];
}
-(IBAction)pass:(id)sender{

    [spinny stopAnimating];
    NSString* passFile = @"http://pass.keatonburleson.com/Pass/pass.pkpass";
    
    NSURL *url = [NSURL URLWithString:passFile];
    //3
    NSData *passData = [NSData dataWithContentsOfURL:url];
    
    //4
    NSError* error = nil;
    PKPass *newPass = [[PKPass alloc] initWithData:passData
                                             error:&error];
    //5
    if (error!=nil) {
        [[[UIAlertView alloc] initWithTitle:@"Passes error"
                                    message:[error
                                             localizedDescription]
                                   delegate:nil
                          cancelButtonTitle:@"Ooops"
                          otherButtonTitles: nil] show];
        return;
    }
    
    //6
    PKAddPassesViewController *addController =
    [[PKAddPassesViewController alloc] initWithPass:newPass];
    
    
    [self presentViewController:addController
                       animated:YES
                     completion:nil];
    
    NSString *urlAddress = @"http://pass.keatonburleson.com/del.php";
    
    //Create a URL object.
    NSURL *url3 = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url3];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
    
}

#pragma mark - Pass controller delegate

-(void)addPassesViewControllerDidFinish: (PKAddPassesViewController*) controller
{
    //pass added
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
