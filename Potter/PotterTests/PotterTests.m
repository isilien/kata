//
//  PotterTests.m
//  PotterTests
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Potter.h"

#define ACCURACY 0.0001

@interface PotterTests : XCTestCase

@end

@implementation PotterTests

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

- (void)testBasics {
    
    Potter *harry = [[Potter alloc] init];
    
    double books[] = {};
    
    XCTAssertEqualWithAccuracy(0, [harry calculatePrice:books], ACCURACY);
    
}

@end
