//
//  UIScrollView+UserSelectionScrollView.h
//  ProjectA
//
//  Created by Liu Di on 11/7/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighLightView.h"
@interface UserSelectionScrollView: UIScrollView
@property NSMutableArray* selections;
@property NSMutableArray* buttons;
@property NSMutableArray* clickedButtons;
@property HighLightView* lineView;
@property NSMutableArray* lineViews;
@property UIView *containerView;
- (void) fetchFromSever;
- (void) showSelection;
- (IBAction) clickOnButton;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
