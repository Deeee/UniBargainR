//
//  NewPostViewController.m
//  ProjectA
//
//  Created by Liu Di on 7/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()

@end

@implementation NewPostViewController
@synthesize ddMenu, ddText;
@synthesize ddMenuShowButton;
@synthesize PaymentMethodMenu,PaymentMethodText;
@synthesize PaymentMethodShowButton;
@synthesize name,description;
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
    name.placeholder = @"Please provide name";
    description.placeholder = @"Please provide description";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ddMenuShow:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
        self.ddMenu.hidden = NO;
        [sender setTitle:@"▲" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        [UIView transitionWithView:ddMenu
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];        
        self.ddMenu.hidden = YES;
        [sender setTitle:@"▼" forState:UIControlStateNormal];
    }
}
- (IBAction)ddMenuSelectionMade:(UIButton *)sender
{
    self.ddText.text = sender.titleLabel.text;
    [self.ddMenuShowButton setTitle:@"▼" forState:UIControlStateNormal];
    self.ddMenuShowButton.tag = 0;
    self.ddMenu.hidden = YES;
    switch (sender.tag) {
        case 1:
//            self.view.backgroundColor = [UIColor redColor];
            break;
        case 2:
//            self.view.backgroundColor = [UIColor blueColor];
            break;
        case 3:
//            self.view.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
}

- (IBAction)PaymentMethodMenuShow:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
        self.PaymentMethodMenu.hidden = NO;
        [sender setTitle:@"▲" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        [UIView transitionWithView:PaymentMethodMenu
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        
        self.PaymentMethodMenu.hidden = YES;
        [sender setTitle:@"▼" forState:UIControlStateNormal];
    }
}

- (IBAction)PaymentMethodMenuSelectionMade:(UIButton *)sender
{
    self.PaymentMethodText.text = sender.titleLabel.text;
    [self.PaymentMethodShowButton setTitle:@"▼" forState:UIControlStateNormal];
    self.PaymentMethodShowButton.tag = 0;
    self.PaymentMethodMenu.hidden = YES;
    switch (sender.tag) {
        case 1:
//            self.view.backgroundColor = [UIColor redColor];
            break;
        case 2:
//            self.view.backgroundColor = [UIColor blueColor];
            break;
        case 3:
//            self.view.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}
@end
