//
//  HomeViewController.h
//  ProjectA
//
//  Created by Liu Di on 7/7/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoubleScrollView.h"
@interface HomeViewController : UIViewController
@property (nonatomic, strong) IBOutlet DoubleScrollView *doubleScroll;
@property IBOutlet InfiniteScrollView *leftScrollView;
@property IBOutlet InfiniteScrollView *rightScrollView;
@end
