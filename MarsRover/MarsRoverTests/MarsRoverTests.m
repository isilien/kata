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

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRoverCreation {
    
    Coordinate *coordinate = [Coordinate coordinateWithX:10 andY:10];
    Rover *rover = [Rover roverWithCoordinate:coordinate andDirection:@"N"];
    
    
    
    
}

@end
