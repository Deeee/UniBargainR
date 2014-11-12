//
//  HighLightView.h
//  ProjectA
//
//  Created by Liu Di on 11/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighLightView : UIView
@property CGPoint from;
@property CGPoint to;
@property NSMutableArray *totalLines;
- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to;
- (void)removeAllLine;
@end
