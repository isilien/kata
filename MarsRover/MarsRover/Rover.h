//
//  Rover.h
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinate.h"
#import "Direction.h"
#import "Grid.h"

@interface Rover : NSObject {
    
    Coordinate *coordinate;
    Direction *direction;
    Grid *grid;
    
}

@property (nonatomic, retain) Direction *direction;
@property (nonatomic, retain) Coordinate *coordinate;
@property (nonatomic, retain) Grid *grid;

+ (Rover *)roverWithCoordinate:(Coordinate *)coordinate andDirection:(Direction *)direction andGrid:(Grid *)grid;


@end
