//
//  Coordinate.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Coordinate.h"

@implementation Coordinate

@synthesize x, y;

+(Coordinate *)coordinateWithX:(int)x andY:(int)y {
    
    Coordinate *c = [Coordinate new];
    c.x = x;
    c.y = y;
    
    return c;
}

@end
