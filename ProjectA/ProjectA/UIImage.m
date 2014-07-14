//
//  UIImage.m
//  ProjectA
//
//  Created by Liu Di on 7/10/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "UIImage.h"

@implementation UIImage (initWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
