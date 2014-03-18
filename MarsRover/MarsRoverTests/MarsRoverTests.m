//
//  MarsRoverTests.m
//  MarsRoverTests
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Rover.h"

@interface MarsRoverTests : XCTestCase

@property (nonatomic, retain) Coordinate *coordinate;
@property (nonatomic, retain) Direction *direction;
@property (nonatomic, retain) Grid *grid;
@property (nonatomic, retain) Rover *rover;

@end

@implementation MarsRoverTests

@synthesize coordinate, direction, grid, rover;

- (void)setUp {
    
    [super setUp];
    // Setup code
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// A Grid should be of size 1 at least
- (void)testValidGrid {
    
    self.grid = [Grid gridWithWidth:-1 andHeight:1];
    XCTAssertNil(self.grid, @"Grid cannot have negative width");
    
    self.grid = [Grid gridWithWidth:1 andHeight:-1];
    XCTAssertNil(self.grid, @"Grid cannot have negative height");
    
    self.grid = [Grid gridWithWidth:-1 andHeight:-1];
    XCTAssertNil(self.grid, @"Grid cannot have negative width and height");
    
    self.grid = [Grid gridWithWidth:0 andHeight:1];
    XCTAssertNil(self.grid, @"Grid cannot have zero width");
    
    self.grid = [Grid gridWithWidth:1 andHeight:0];
    XCTAssertNil(self.grid, @"Grid cannot have zero height");
    
    self.grid = [Grid gridWithWidth:0 andHeight:0];
    XCTAssertNil(self.grid, @"Grid cannot have zero width and height");
    
    self.grid = [Grid gridWithWidth:1 andHeight:1];
    XCTAssertEqual(1, self.grid.width, @"Grid should have width 1");
    XCTAssertEqual(1, self.grid.height, @"Grid should have height 1");
}

// A coordinate is [0, ∞);
- (void)testValidCoordinate {
    
    self.coordinate = [Coordinate coordinateWithX:-1 andY:1];
    XCTAssertNil(self.coordinate, @"X coordinate cannot be negative");
    
    self.coordinate = [Coordinate coordinateWithX:1 andY:-1];
    XCTAssertNil(self.coordinate, @"Y coordinate cannot be negative");
    
    self.coordinate = [Coordinate coordinateWithX:-1 andY:-1];
    XCTAssertNil(self.coordinate, @"X and Y coordinates cannot be negative");
    
    self.coordinate = [Coordinate coordinateWithX:0 andY:10];
    XCTAssertEqual(0, self.coordinate.x, @"X coordinate should be 0");
    XCTAssertEqual(10, self.coordinate.y, @"Y coordinate should be 0");
}


// A direction ∈ {N, S, E, W}
- (void)testValidDirection {
    
    self.direction = [Direction directionWithDescription:@"n"];
    XCTAssertEqualObjects(@"N", self.direction.description, @"Direction description should be North");
    
    self.direction = [Direction directionWithDescription:@"s"];
    XCTAssertEqualObjects(@"S", self.direction.description, @"Direction description should be South");
    
    self.direction = [Direction directionWithDescription:@"e"];
    XCTAssertEqualObjects(@"E", self.direction.description, @"Direction description should be East");
    
    self.direction = [Direction directionWithDescription:@"w"];
    XCTAssertEqualObjects(@"W", self.direction.description, @"Direction description should be West");
    
    self.direction = [Direction directionWithDescription:@"ssajaks"];
    XCTAssertNil(self.direction, @"Direction description can only be N, S, E, W");
    
}

// A Rover must have a valid coordinate, direction and grid
- (void)testValidRover {
    
    self.coordinate = [Coordinate coordinateWithX:10 andY:10];
    self.direction = [Direction directionWithDescription:@"N"];
    self.grid = [Grid gridWithWidth:5 andHeight:5];
    self.rover = [Rover roverWithCoordinate:self.coordinate andDirection:self.direction andGrid:self.grid];
    
    XCTAssertNil(self.rover, @"Rover cannot have a coordinate larger than the size of the grid");
    
    self.coordinate = [Coordinate coordinateWithX:0 andY:2];
    self.direction = [Direction directionWithDescription:@"e"];
    self.grid = [Grid gridWithWidth:10 andHeight:15];
    self.rover = [Rover roverWithCoordinate:self.coordinate andDirection:self.direction andGrid:self.grid];
    
    XCTAssertEqualObjects(@"E", self.rover.direction.description, @"Curiosity should have direction East");
    XCTAssertEqual(0, self.rover.coordinate.x, @"Curiosity should have X coordinate 0");
    XCTAssertEqual(2, self.rover.coordinate.y, @"Curiosity should have Y coordinate 2");
    XCTAssertEqual(10, self.rover.grid.width, @"Curiosity should be on a grid with width 10");
    XCTAssertEqual(15, self.rover.grid.height, @"Curiosity should be on a grid with height 15");
    
}



@end
