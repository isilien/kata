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
                
                if (![self obstacleAhead:instructions[i]]) {
                    [self moveForward];
                }
                else {
                    NSLog(@"Obstacle! Houston, we have a problem!");
                    break;
                }
            }
            else if ([instructions[i] isEqualToString:@"b"]) {
                if (![self obstacleAhead:instructions[i]]) {
                    [self moveBackward];
                }
                else {
                    NSLog(@"Obstacle! Houston, I must stop!");
                    break;
                }
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
    
    if ([self.direction.description isEqualToString:@"N"]) {
        self.coordinate.y = ((self.coordinate.y + 1) == self.grid.height) ? 0 : (self.coordinate.y + 1);
    }
    else if ([self.direction.description isEqualToString:@"S"]) {
        self.coordinate.y = ((self.coordinate.y - 1) == -1) ? (self.grid.height - 1) : (self.coordinate.y - 1);
    }
    else if ([self.direction.description isEqualToString:@"W"]) {
        self.coordinate.x = ((self.coordinate.x - 1) == -1) ? (self.grid.width - 1) : (self.coordinate.x - 1);
    }
    else if ([self.direction.description isEqualToString:@"E"]) {
        self.coordinate.x = ((self.coordinate.x + 1) == self.grid.width) ? 0 : (self.coordinate.x + 1);
    }
}

- (void)moveBackward {
    
    if ([self.direction.description isEqualToString:@"N"]) {
        self.coordinate.y = ((self.coordinate.y - 1) == -1) ? (self.grid.height - 1) : (self.coordinate.y - 1);
    }
    else if ([self.direction.description isEqualToString:@"S"]) {
        self.coordinate.y = ((self.coordinate.y + 1) == self.grid.height) ? 0 : (self.coordinate.y + 1);
    }
    else if ([self.direction.description isEqualToString:@"W"]) {
        self.coordinate.x = ((self.coordinate.x + 1) == self.grid.width) ? 0 : (self.coordinate.x + 1);
    }
    else if ([self.direction.description isEqualToString:@"E"]) {
        self.coordinate.x = ((self.coordinate.x - 1) == -1) ? (self.grid.width - 1) : (self.coordinate.x - 1);
    }
}

- (void)turnLeft {
    
    if ([self.direction.description isEqualToString:@"N"]) {
        self.direction.description = @"W";
    }
    else if ([self.direction.description isEqualToString:@"S"]) {
        self.direction.description = @"E";
    }
    else if ([self.direction.description isEqualToString:@"W"]) {
        self.direction.description = @"S";
    }
    else if ([self.direction.description isEqualToString:@"E"]) {
        self.direction.description = @"N";
    }
}

- (void)turnRight {
    
    if ([self.direction.description isEqualToString:@"N"]) {
        self.direction.description = @"E";
    }
    else if ([self.direction.description isEqualToString:@"S"]) {
        self.direction.description = @"W";
    }
    else if ([self.direction.description isEqualToString:@"W"]) {
        self.direction.description = @"N";
    }
    else if ([self.direction.description isEqualToString:@"E"]) {
        self.direction.description = @"S";
    }
}

- (BOOL)validateCommand:(NSString *) command {
    
    if ([command isEqualToString:@"f"] || [command isEqualToString:@"b"] || [command isEqualToString:@"r"] || [command isEqualToString:@"l"]) return YES;
    
    return NO;    
}

- (BOOL)obstacleAhead:(NSString *) command {
    
    BOOL obstacle = NO;

    if ([command isEqualToString:@"f"]) {
        [self moveForward];
    }
    else {        
        [self moveBackward];
    }
    
    for (int i = 0; i < [self.grid.obstacles count]; i++) {
        if ([self.grid.obstacles[i][0] intValue] == self.coordinate.x && [self.grid.obstacles[i][1] intValue] == self.coordinate.y) {
            obstacle = YES;
        }
    }
    
    // Undo the movement
    if ([command isEqualToString:@"f"]) {
        [self moveBackward];
    }
    else {
        [self moveForward];
    }
    
    return obstacle;
}

@end
