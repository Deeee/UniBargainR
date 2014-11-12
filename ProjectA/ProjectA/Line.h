//
//  Line.h
//  ProjectA
//
//  Created by Liu Di on 11/8/14.
//  Copyright (c) 2014 Liu Di. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject
@property CGPoint from;
@property CGPoint to;
-(id) initWith:(CGPoint) from and:(CGPoint) to;
@end
