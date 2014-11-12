//
//  UIScrollView+UserSelectionScrollView.m
//  ProjectA
//
//  Created by Liu Di on 11/7/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "UserSelectionScrollView.h"
#import "SelectionItem.h"
#import "InfiniteScrollView.h"
@implementation UserSelectionScrollView
@synthesize clickedButtons;
@synthesize selections;
@synthesize containerView;
@synthesize buttons;
@synthesize lineView;
@synthesize lineViews;
typedef enum {
    resturants = 1,
    clubs = 2,
    cafe = 3,
    wines = 4,
    pubs = 5,
    drinks = 6,
    EnumTypeMax
} EnumType;
- (id) initWithFrame:(CGRect)frame {
    NSLog(@"initwithfram userselection");
    self = [super initWithFrame:frame];
    if (self) {
        [self fetchFromSever];
        NSUInteger timeFrame = [selections count];
        containerView = [[UIView alloc] init];
        self.contentSize = CGSizeMake(self.frame.size.width, 5000);
        self.containerView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        [self setContainerView:containerView];
//        [self addSubview:self.containerView];
//        [containerView setUserInteractionEnabled:NO];

        [self showSelection];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [self addSubview:[[InfiniteScrollView alloc] initWithFrame:self.frame]];
//        [button addTarget:self
//                   action:@selector(aMethod:)
//         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Show View" forState:UIControlStateNormal];
        button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [self.containerView addSubview:button];
    
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    [self showSelection];
    // tile content in visible bounds
    CGRect visibleBounds = [self convertRect:[self bounds] toView:self.containerView];
    //    [self insertLabel];
}
- (void) fetchFromSever {
    int row = rand() % (5 - 1 + 1);

    selections = [[NSMutableArray alloc] init];
    for (int i = 0; i < row; i ++) {
        NSMutableArray *curTime = [[NSMutableArray alloc] init];
        int column = rand() % (5 - 1 + 1);
        for (int j = 0; j < column; j ++) {
            SelectionItem *randomI = [[SelectionItem alloc] init];
            EnumType randomType = (EnumType) (arc4random() % (int) EnumTypeMax);
            if (randomType == 1) {
                [randomI setKind:@"resturants"];
            }
            else if(randomType == 2) {
                [randomI setKind:@"clubs"];
            }
            else if(randomType == 3) {
                [randomI setKind:@"cafes"];
            }
            else if (randomType == 4) {
                [randomI setKind:@"wines"];
            }
            else if (randomType == 5) {
                [randomI setKind:@"pubs"];
            }
            else {
                [randomI setKind:@"drinks"];
            }
            NSString *randomNum = [NSString stringWithFormat:@"%0.10u", arc4random()];
            [randomI setItemDescription:randomNum];
            [curTime addObject:randomI];
        }
        [selections addObject:curTime];
    }
}
- (void) showSelection {
    lineView = [[HighLightView alloc] initWithFrame:self.frame];
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    [lineView setUserInteractionEnabled:NO];
    
    clickedButtons = [[NSMutableArray alloc] init];
    [self fetchFromSever];
    NSUInteger timeFrame = [selections count];
    containerView = [[UIView alloc] init];
    self.contentSize = CGSizeMake(self.frame.size.width, 150 * timeFrame);
    self.containerView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
//    [containerView ]
    [self addSubview:containerView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
                       action:@selector(reset:)
             forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"clear" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 160.0, 40.0);
    [self.containerView addSubview:button];
    [containerView setUserInteractionEnabled:YES];
    

    
    int timeCount = 0;
    int curYFrame = 0;
    int radius = 0;
    for (NSMutableArray *curTime in selections) {
        NSLog(@"timeCount %d", timeCount);
        NSUInteger buttonNum = [curTime count];
        int buttonCount = 0;
        UILabel* label = [[UILabel alloc] init];

        for (SelectionItem *i in curTime) {
            
            NSLog(@"button :%@", [i kind]);
            radius = (320 - 100) / buttonNum;
            if (radius > 150) {
                radius = 150;
            }
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            [button setTitle:[NSString stringWithFormat:@"%@",[i description]] forState:UIControlStateNormal];
//            button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
            button.frame = CGRectMake(radius * buttonCount + 100 + 1/2 * radius, curYFrame + radius/2, radius/2, radius/2);
            [button addTarget:self
                       action:@selector(tapOnButton:)
             forControlEvents:UIControlEventTouchUpInside];
//            [button setTitle:[NSString stringWithFormat:@"%@",i.kind] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",i.kind] ] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",i.kind] ] forState:UIControlStateSelected];
            [self.containerView addSubview:button];
            [buttons addObject:button];
            buttonCount++;
        }

        if (timeCount == 0) {
            label.backgroundColor = [UIColor colorWithPatternImage:[[self class] imageWithImage:[UIImage imageNamed:@"sun"] scaledToSize:CGSizeMake(radius/2 + 10, radius/2 + 10)]];
        }
        else if(timeCount == 1) {
            label.backgroundColor = [UIColor colorWithPatternImage:[[self class] imageWithImage:[UIImage imageNamed:@"cloud"] scaledToSize:CGSizeMake(radius/2 + 10, radius/2 + 10)]];
        }
        else {
            label.backgroundColor = [UIColor colorWithPatternImage:[[self class] imageWithImage:[UIImage imageNamed:@"moon"] scaledToSize:CGSizeMake(radius/2 + 10, radius/2 + 10)]];
        }
        label.frame = CGRectMake(0, curYFrame + radius/2, radius/2 + 10, radius/2 + 10);
        [self.containerView addSubview:label];
        curYFrame += radius;
        timeCount ++;
    }
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 addTarget:self
                action:@selector(reset:)
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"reserve!" forState:UIControlStateNormal];
    button2.frame = CGRectMake(100, curYFrame + 40, 160.0, 40.0);
    [self.containerView addSubview:button2];
    [containerView setUserInteractionEnabled:YES];
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//- (void)touchesBegan: (NSSet *)touches withEvent:(UIEvent *)event{
//    if ([touches count] == 1) {
//        
//    CGPoint touchPoint = [[touches anyObject] locationInView:self.containerView];
//    for (UIButton *b in buttons) {
//        if (touchPoint.x > b.frame.origin.x &&
//            touchPoint.x < b.frame.origin.x + b.frame.size.width &&
//            touchPoint.y > b.frame.origin.y &&
//            touchPoint.y < b.frame.origin.y + b.frame.size.height) {
//            [b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",[b titleColorForState:UIControlStateNormal]] ] forState:UIControlStateNormal];
//
//        }
//    }
//    }
//
//}
//- (void)touchesMoved: (NSSet *)touches withEvent:(UIEvent *)event{
//    CGPoint touchPoint = [[touches anyObject] locationInView:self];
//    for (UIButton *b in buttons) {
//        if (touchPoint.x > b.frame.origin.x &&
//            touchPoint.x < b.frame.origin.x + b.frame.size.width &&
//            touchPoint.y > b.frame.origin.y &&
//            touchPoint.y < b.frame.origin.y + b.frame.size.height) {
//            [b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",[b titleColorForState:UIControlStateNormal]] ] forState:UIControlStateNormal];
//            
//        }
//    }
//}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    CGPoint touchPoint = [[touches anyObject] locationInView:self];
//    for (UIButton *b in buttons) {
//        if (touchPoint.x > b.frame.origin.x &&
//            touchPoint.x < b.frame.origin.x + b.frame.size.width &&
//            touchPoint.y > b.frame.origin.y &&
//            touchPoint.y < b.frame.origin.y + b.frame.size.height) {
//            [b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",[b titleColorForState:UIControlStateNormal]] ] forState:UIControlStateNormal];
//            
//        }
//    }
//}

//- (IBAction) clickOnButton:(UIPanGestureRecognizer *)gesture{
//    NSLog(@"here");
//    CGPoint touchPoint = [gesture locationInView:self.superview];
//    for (UIButton *b in buttons) {
//        if (touchPoint.x > b.frame.origin.x &&
//            touchPoint.x < b.frame.origin.x + b.frame.size.width &&
//            touchPoint.y > b.frame.origin.y &&
//            touchPoint.y < b.frame.origin.y + b.frame.size.height) {
//            
//            [b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",[b titleColorForState:UIControlStateNormal]] ] forState:UIControlStateNormal];
//            
//        }
//    }
//}
- (IBAction) tapOnButton:(UIButton *)gesture{
    NSUInteger count = [clickedButtons count];
    UIButton *button = (UIButton *)gesture;
    button.selected = !button.selected;
    NSLog(@"passs! %ld",count);

    if ([gesture isKindOfClass:[UIButton class]]) {
        [clickedButtons addObject:gesture];
        count++;
        NSLog(@"here we go");
        if (count > 1) {
            UIButton *b1 = [clickedButtons objectAtIndex:count - 2];
            [lineView drawLineFrom:CGPointMake(b1.center.x, b1.center.y) to:CGPointMake(gesture.center.x,gesture.center.y)];
        }
    }
    
//    CGPoint touchPoint = [gesture locationInView:self.superview];
//
//    for (UIButton *b in buttons) {
//        if (touchPoint.x > b.frame.origin.x &&
//            touchPoint.x < b.frame.origin.x + b.frame.size.width &&
//            touchPoint.y > b.frame.origin.y &&
//            touchPoint.y < b.frame.origin.y + b.frame.size.height) {
//            NSLog(@"here we go");
//            [b setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@touch.png",[b titleColorForState:UIControlStateNormal]] ] forState:UIControlStateNormal];
//            
//        }
//    }
    
}
- (IBAction) reset:(UIButton *)gesture{
    [lineView removeAllLine];
    for (UIButton *b in clickedButtons) {
        UIButton *button = (UIButton *)b;
        button.selected = !button.selected;
    }
    [clickedButtons removeAllObjects];
}
@end
