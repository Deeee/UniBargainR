//
//  HighLightView.m
//  ProjectA
//
//  Created by Liu Di on 11/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "HighLightView.h"
#import "Line.h"
@implementation HighLightView
@synthesize from = _from;
@synthesize to = _to;
@synthesize totalLines;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        totalLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextSetLineWidth(context, 4.0);
    for (Line *l in totalLines) {
        CGContextMoveToPoint(context, l.from.x, l.from.y);
        CGContextAddLineToPoint(context, l.to.x, l.to.y);
        CGContextDrawPath(context, kCGPathStroke);
    }

    NSLog(@"drawing from %.2f,%.2f to %.2f,%.2f",_from.x,_from.y,_to.x,_to.y);
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(_from.x, _from.y)];
//    [path addLineToPoint:CGPointMake(_to.x, _to.y)];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    
//    
//    CGContextSetLineWidth(context, 10.0);
//    //    // Set the circle outerline-colour
//    [[UIColor redColor] set];
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, nil, _from.x, _from.y);
//    CGPathMoveToPoint(path, nil, _to.x, _to.y);
//    CGContextAddPath(context, path);
//    // Draw
//    CGContextStrokePath(context);
}
- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to {
    _from = from;
    _to = to;
    Line *new = [[Line alloc] initWith:from and:to];
    [totalLines addObject:new];
    [self setNeedsDisplay];


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) removeAllLine{
    [totalLines removeAllObjects];
    [self setNeedsDisplay];
}
@end
