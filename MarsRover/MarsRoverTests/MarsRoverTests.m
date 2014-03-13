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

@end

@implementation MarsRoverTests

- (void)setUp {
    
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


// Creating a valid Rover
- (void)testValidRoverCreation {
    
    Coordinate *coordinate = [Coordinate coordinateWithX:10 andY:20];
    Rover *rover = [Rover roverWithCoordinate:coordinate andDirection:@"N"];
    
    XCTAssertEqual(10, rover.coordinate.x, @"Curiosity's x coordinate should be 10");
    XCTAssertEqual(20, rover.coordinate.y, @"Curiosity's y coordinate should be 20");
    XCTAssertEqual(@"N", rover.direction, @"Curiosity's direction should be North");
}

// Test invalid Rover cases
- (void)testInvalidRoverCreation {
    
    Coordinate *coordinate = [Coordinate coordinateWithX:-10 andY:0];
    Rover *rover = [Rover roverWithCoordinate:coordinate andDirection:@"N"];
    XCTAssertNil(rover, @"Rover should not have a negative coordinate");
    
    coordinate = [Coordinate coordinateWithX:0 andY:0];
    rover = [Rover roverWithCoordinate:coordinate andDirection:@"asadasw"];
    XCTAssertNil(rover, @"Rover should not have a direction other than N-S-E-W");
    
    
}

@end
