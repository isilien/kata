//
//  Rover.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Rover.h"

@interface Rover()

- (BOOL)validateDirection:(NSString *)dir;

@end

@implementation Rover

@synthesize direction, coordinate;


+ (Rover *)roverWithCoordinate:(Coordinate *)coordinate andDirection:(NSString *)direction{
    
    Rover *rover = [Rover new];
    
    if (coordinate && [rover validateDirection:direction]) {
        rover.coordinate = coordinate;
        rover.direction = direction;
        return rover;
    }

    return nil;
}

#pragma mark Private Methods

- (BOOL)validateDirection:(NSString *)dir {
    
    dir = [dir uppercaseString];
    
    if ([dir isEqualToString:@"N"] || [dir isEqualToString:@"S"] || [dir isEqualToString:@"E"] || [dir isEqualToString:@"W"]) return YES;
    
    return NO;
}



@end
