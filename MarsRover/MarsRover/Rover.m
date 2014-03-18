//
//  Rover.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Rover.h"

@interface Rover()

// Validations
- (BOOL)validateInitialLocation;
- (BOOL)validateCommand:(NSString *) command;
- (BOOL)obstacleAhead:(NSString *) command;

// Instructions
- (void)moveForward;
- (void)moveBackward;
- (void)turnLeft;
- (void)turnRight;

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

- (void)move:(NSArray *)instructions {
    
    for (int i = 0; i < [instructions count]; i++) {
        
        if ([self validateCommand:instructions[i]]) {
            
            if ([instructions[i] isEqualToString:@"f"]) {
                [self moveForward];
            }
            else if ([instructions[i] isEqualToString:@"b"]) {
                [self moveBackward];
            }
            else if ([instructions[i] isEqualToString:@"l"]) {
                [self turnLeft];
            }
            else if ([instructions[i] isEqualToString:@"r"]) {
                [self turnRight];
            }
        }
        else {
            NSLog(@"Invalid instruction!");
            break;
        }
    }
}


#pragma mark Private Methods

//
// Rover's initial location's coordinates cannot increase the grid size
//
- (BOOL)validateInitialLocation {
    
    if (self.coordinate.x > self.grid.width || self.coordinate.y > self.grid.height) return NO;
    
    return YES;
    
}


- (void)moveForward {
    
    
}

- (void)moveBackward {
    
}

- (void)turnLeft {
    
}

- (void)turnRight {
    
}

- (BOOL)validateCommand:(NSString *) command {
    
    if ([command isEqualToString:@"f"] || [command isEqualToString:@"b"] || [command isEqualToString:@"r"] || [command isEqualToString:@"l"]) return YES;
    
    return NO;
    
}

//
// We only need to check if there is an obstacle when moving forward/backward
//
- (BOOL)obstacleAhead:(NSString *) command {
    
    if ([command isEqualToString:@"f"]) {
        
        
        
    }
    else {
        
    }
    
    return nil;
    
}

@end
