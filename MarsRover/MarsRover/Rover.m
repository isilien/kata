//
//  Rover.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Rover.h"

@interface Rover()

- (BOOL)validateInitialLocation;

@end

@implementation Rover

@synthesize direction, coordinate, grid;


+ (Rover *)roverWithCoordinate:(Coordinate *)coordinate andDirection:(Direction *)direction andGrid:(Grid *)grid {
    
    Rover *rover = [Rover new];
    
    if (coordinate && grid && direction) {
        
        rover.coordinate = coordinate;
        rover.direction = direction;
        rover.grid = grid;
        
        if ([rover validateInitialLocation]) return rover;
    }

    return nil;
}

#pragma mark Private Methods

/**
 * Rover's initial location's coordinates cannot increase the grid size
 */
- (BOOL)validateInitialLocation {
    
    if (self.coordinate.x > self.grid.width || self.coordinate.y > self.grid.height) return NO;
    
    return YES;
    
}

@end
