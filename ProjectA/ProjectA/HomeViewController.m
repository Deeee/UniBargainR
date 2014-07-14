//
//  HomeViewController.m
//  ProjectA
//
//  Created by Liu Di on 7/7/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "HomeViewController.h"
#import "UIImage.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize doubleScroll;
@synthesize leftScrollView;
@synthesize rightScrollView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.translucent = YES;
//    
    UIImage *gradientImage44 = [UIImage imageWithColor:[UIColor colorWithRed:255 green:221 blue:131 alpha:0.8]];
    
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44 forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setBackgroundImage:gradientImage32 forBarMetrics:UIBarMetricsLandscapePhone];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    doubleScroll = [[DoubleScrollView alloc] initWithFrame: doubleScroll.frame];
//    [UIScrollView beginAnimations:@"scrollAnimation" context:nil];
//    
//    [UIScrollView setAnimationDuration:2];
//    
//    [self.doubleScroll.leftScrollView setContentOffset:CGPointMake(160, 568)];
//
//    [UIScrollView commitAnimations];

//    CGPoint bottomOffset = CGPointMake(self.leftScrollView.contentOffset.x, self.leftScrollView.contentSize.height - self.leftScrollView.bounds.size.height);
//    [self.leftScrollView setContentOffset:bottomOffset animated:NO];
    
    
//    CGPoint bottomOffset = CGPointMake(self.leftScrollView.contentOffset.x,
//                                       self.leftScrollView.contentSize.height -
//                                       self.leftScrollView.bounds.size.height);
//    [self.leftScrollView setContentOffset:bottomOffset animated:NO];
//    
//    CGPoint newOffset = self.leftScrollView.contentOffset;
//    newOffset.y = 0;
//    [self.leftScrollView setContentOffset:newOffset animated:YES];
    NSLog(@"in homeview view did load");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    
//    CGPoint newOffset = self.leftScrollView.contentOffset;
//    newOffset.y = 0;
//    [self.leftScrollView setContentOffset:newOffset animated:YES];
    [UIScrollView beginAnimations:@"scrollAnimation" context:nil];
    
    [UIScrollView setAnimationDuration:50];
    
    [leftScrollView setContentOffset:CGPointMake(0 , 400)];
    
    [UIScrollView commitAnimations];
}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGPoint currentOffset = self.currentChannelTableView.contentOffset;
//    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
//    
//    NSTimeInterval timeDiff = currentTime - lastOffsetCapture;
//    if(timeDiff > 0.1) {
//        CGFloat distance = currentOffset.y - lastOffset.y;
//        //The multiply by 10, / 1000 isn't really necessary.......
//        CGFloat scrollSpeedNotAbs = (distance * 10) / 1000; //in pixels per millisecond
//        
//        CGFloat scrollSpeed = fabsf(scrollSpeedNotAbs);
//        if (scrollSpeed > 0.5) {
//            isScrollingFast = YES;
//            NSLog(@"Fast");
//        } else {
//            isScrollingFast = NO;
//            NSLog(@"Slow");
//        }
//        
//        lastOffset = currentOffset;
//        lastOffsetCapture = currentTime;
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
