//
//  LoginViewController.h
//  ProjectA
//
//  Created by Liu Di on 6/21/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property(nonatomic, strong) IBOutlet UITextField *userName;
@property(nonatomic, strong) IBOutlet UITextField *userPassword;
@property NSString *testServer;
- (IBAction)sigininClicked:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
