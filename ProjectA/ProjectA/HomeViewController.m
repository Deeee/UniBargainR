//
//  HomeViewController.m
//  ProjectA
//
//  Created by Liu Di on 7/7/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
