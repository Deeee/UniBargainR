//
//  InfiniteScrollView.m
//  ProjectA
//
//  Created by Liu Di on 7/9/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "InfiniteScrollView.h"

@interface InfiniteScrollView ()

@property (nonatomic, strong) NSMutableArray *visibleLabels;
@property (nonatomic, strong) UIView *labelContainerView;
@property int imageCheck;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end


@implementation InfiniteScrollView
@synthesize imageCheck;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentSize = CGSizeMake(self.frame.size.width, 5000);
        
        _visibleLabels = [[NSMutableArray alloc] init];
        
        _labelContainerView = [[UIView alloc] init];
        self.labelContainerView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        [self addSubview:self.labelContainerView];
        
        [self.labelContainerView setUserInteractionEnabled:NO];
        
        // hide horizontal scroll indicator so our recentering trick is not revealed
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];

    }
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
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        self.contentSize = CGSizeMake(self.frame.size.width, 5000);
        
        _visibleLabels = [[NSMutableArray alloc] init];
        
        _labelContainerView = [[UIView alloc] init];
        self.labelContainerView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        [self addSubview:self.labelContainerView];
        
        [self.labelContainerView setUserInteractionEnabled:NO];
        
        // hide horizontal scroll indicator so our recentering trick is not revealed
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
    }
    
    return self;
}

- (void)recenterIfNecessary
{
    CGPoint currentOffset = [self contentOffset];
    CGFloat contentHeight = [self contentSize].height;
    CGFloat centerOffsetY = (contentHeight - [self bounds].size.height) / 2.0;
    CGFloat distanceFromCenter = fabs(currentOffset.y - centerOffsetY);
    
    if (distanceFromCenter > (contentHeight / 4.0))
    {
        self.contentOffset = CGPointMake(currentOffset.x, centerOffsetY);
        
        // move content by the same amount so it appears to stay still
        for (UILabel *label in self.visibleLabels) {
            CGPoint center = [self.labelContainerView convertPoint:label.center toView:self];
            center.y += (centerOffsetY - currentOffset.y);
            label.center = [self convertPoint:center toView:self.labelContainerView];
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self recenterIfNecessary];
    
    // tile content in visible bounds
    CGRect visibleBounds = [self convertRect:[self bounds] toView:self.labelContainerView];
    CGFloat minimumVisibleY = CGRectGetMinY(visibleBounds);
    CGFloat maximumVisibleY = CGRectGetMaxY(visibleBounds);
//    [self insertLabel];
    [self tileLabelsFromMinX:minimumVisibleY toMaxX:maximumVisibleY];
}


#pragma mark - Label Tiling
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UILabel *)insertLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
//    [label setNumberOfLines:3];
//    [label setText:@"1024 Block Street\nShaffer, CA\n95014"];
    UIImage *labelImage;

    if (imageCheck == 0) {
        labelImage = [UIImage imageNamed:@"background1.jpg"];
        imageCheck = 2;

    }
    else if(imageCheck == 1){
        labelImage = [UIImage imageNamed:@"background2.jpg"];
        imageCheck --;
    }
    else {
        labelImage = [UIImage imageNamed:@"background3.jpg"];
        imageCheck --;
    }
    labelImage = [InfiniteScrollView imageWithImage:labelImage scaledToSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    [label setBackgroundColor:[UIColor colorWithPatternImage:labelImage]];
    [self.labelContainerView addSubview:label];
    
    return label;
}

- (CGFloat)placeNewLabelOnBottom:(CGFloat)bottomEdge
{
    UILabel *label = [self insertLabel];
    [self.visibleLabels addObject:label]; // add rightmost label at the end of the array
    
    CGRect frame = [label frame];
    frame.origin.x = [self.labelContainerView bounds].size.width - frame.size.width;
    frame.origin.y = bottomEdge;
    [label setFrame:frame];
    
    return CGRectGetMaxY(frame);
}

- (CGFloat)placeNewLabelOnTop:(CGFloat)topEdge
{
    UILabel *label = [self insertLabel];
    [self.visibleLabels insertObject:label atIndex:0]; // add leftmost label at the beginning of the array
    
    CGRect frame = [label frame];
    frame.origin.x = [self.labelContainerView bounds].size.width - frame.size.width;
    frame.origin.y = topEdge - frame.size.height;
    [label setFrame:frame];
    
    return CGRectGetMinY(frame);
}

- (void)tileLabelsFromMinX:(CGFloat)minimumVisibleY toMaxX:(CGFloat)maximumVisibleY
{
    // the upcoming tiling logic depends on there already being at least one label in the visibleLabels array, so
    // to kick off the tiling we need to make sure there's at least one label
    if ([self.visibleLabels count] == 0)
    {
        [self placeNewLabelOnBottom:minimumVisibleY];
    }
    // add labels that are missing on right side
    UILabel *lastLabel = [self.visibleLabels lastObject];
    CGFloat bottomEdge = CGRectGetMaxY([lastLabel frame]);
    while (bottomEdge < maximumVisibleY)
    {
        bottomEdge = [self placeNewLabelOnBottom:bottomEdge];
    }

    // add labels that are missing on left side
    UILabel *firstLabel = self.visibleLabels[0];
    CGFloat topEdge = CGRectGetMinY([firstLabel frame]);
    while (topEdge > minimumVisibleY)
    {
        topEdge = [self placeNewLabelOnTop:topEdge];
    }

    // remove labels that have fallen off right edge
    lastLabel = [self.visibleLabels lastObject];
    while ([lastLabel frame].origin.y > maximumVisibleY)
    {
        [lastLabel removeFromSuperview];
        [self.visibleLabels removeLastObject];
        lastLabel = [self.visibleLabels lastObject];
    }
    
    // remove labels that have fallen off left edge
    firstLabel = self.visibleLabels[0];
    while (CGRectGetMaxY([firstLabel frame]) < minimumVisibleY)
    {
        [firstLabel removeFromSuperview];
        [self.visibleLabels removeObjectAtIndex:0];
        firstLabel = self.visibleLabels[0];
    }
}

@end
