//
//  Line.m
//  ProjectA
//
//  Created by Liu Di on 11/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import "Line.h"

@implementation Line
@synthesize from = _from;
@synthesize to = _to;
-(id) initWith:(CGPoint) from and:(CGPoint) to{
    self = [super init];
    if(self){
        _from = from;
        _to = to;
    }
    return self;
}

@end
