//
//  Coordinate.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Coordinate.h"

@interface Coordinate()

- (BOOL)validateCoordinate:(Coordinate *)coordinate;

@end

@implementation Coordinate

@synthesize x, y;

+ (Coordinate *)coordinateWithX:(int)x andY:(int)y {
    
    Coordinate *c = [Coordinate new];
    c.x = x;
    c.y = y;
    
    if ([c validateCoordinate:c]) return c;
    
    return nil;
}

- (BOOL)validateCoordinate:(Coordinate *)coordinate {
    
    if (coordinate.x >= 0 && coordinate.y >= 0) return YES;
    
    return NO;
}

@end
