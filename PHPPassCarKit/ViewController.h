//
//  ViewController.h
//  PHPPassCarKit
//
//  Created by Keaton Burleson on 10/6/12.
//  Copyright (c) 2012 Keaton Burleson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITextField *label;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *spinny;
    UITapGestureRecognizer *tapRecognizer;


}
@property (nonatomic, retain) UIWebView *webView;
@property IBOutlet UITextField *label;
-(IBAction)generate:(id)sender;
@property IBOutlet UIActivityIndicatorView *spinny;
-(IBAction)hideKB:(id)sender;
@end
