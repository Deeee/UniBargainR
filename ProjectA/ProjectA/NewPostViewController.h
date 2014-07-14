//
//  NewPostViewController.h
//  ProjectA
//
//  Created by Liu Di on 7/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField *name;
@property (nonatomic, strong) IBOutlet UITextField *description;




@property (nonatomic, strong) IBOutlet UILabel *ddText;
@property (nonatomic, strong) IBOutlet UIView *ddMenu;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton;

@property (nonatomic, strong) IBOutlet UILabel *PaymentMethodText;
@property (nonatomic, strong) IBOutlet UIView *PaymentMethodMenu;
@property (nonatomic, strong) IBOutlet UIButton *PaymentMethodShowButton;
- (IBAction)PaymentMethodMenuShow:(UIButton *)sender;
- (IBAction)PaymentMethodMenuSelectionMade:(UIButton *)sender;

- (IBAction)backgroundTap:(id)sender;

@end
