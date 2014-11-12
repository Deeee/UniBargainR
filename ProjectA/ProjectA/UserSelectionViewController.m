
//
//  UserSelectionViewController.m
//  ProjectA
//
//  Created by Liu Di on 11/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "UserSelectionViewController.h"

@interface UserSelectionViewController ()

@end

@implementation UserSelectionViewController
@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [scrollView setScrollEnabled:YES];
    [scrollView setUserInteractionEnabled:YES];
    [self.view bringSubviewToFront:scrollView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scrollView showSelection];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
