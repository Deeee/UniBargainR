//
//  DoubleScrollView.m
//  ProjectA
//
//  Created by Liu Di on 7/10/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "DoubleScrollView.h"
@implementation DoubleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
//    leftScrollView = [[InfiniteScrollView alloc] initWithFrame:self.frame];
//    [self addSubview:leftScrollView];
    NSLog(@"finish initing doublescrollview");
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
