//
//  PrimeFactorsTests.m
//  PrimeFactorsTests
//
//  Created by Isil Demir on 1/20/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "PrimeFactors.h"

@interface PrimeFactorsTests : XCTestCase

@end

@implementation PrimeFactorsTests

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

// Generate should return a non-empty array
- (void)testGenerateReturnsArray {
    
    PrimeFactors *pf = [[PrimeFactors alloc] init];
    NSNumber *testNumber = [NSNumber numberWithInt:8];
    
    NSMutableArray *result = [pf generate:testNumber];
    
    XCTAssertTrue([result isKindOfClass:[NSMutableArray class]], @"Generate should return an array");
    XCTAssertTrue([result count] > 0, @"Generate should return a non-empty array");
    
}

// Generate should return an array of size 0 if given a number with no prime factors
- (void)testGenerateShouldReturnEmptyArray {
    
    PrimeFactors *pf = [[PrimeFactors alloc] init];
    
    NSNumber *numberWithNoPrimeFactors = [NSNumber numberWithInt:1];
    
    NSMutableArray *result = [pf generate:numberWithNoPrimeFactors];
    
    XCTAssertTrue([result count] == 0, @"Generate should return an empty array if given a number with no prime factors");
    
}

// Generate should return [2, 3] if given 6
- (void)testCaseForSix {
    
    PrimeFactors *pf = [[PrimeFactors alloc] init];
    NSMutableArray *result = [pf generate:[NSNumber numberWithInt:6]];
    
    XCTAssertEqual([result objectAtIndex:0], [NSNumber numberWithInt:2], @"First element should be 2");
    XCTAssertEqual([result objectAtIndex:1], [NSNumber numberWithInt:3], @"Second element should be 3");
    
}

// Generate should return [3,3] if given 9
- (void)testCaseForNine {
    
    PrimeFactors *pf = [[PrimeFactors alloc] init];
    NSMutableArray *result = [pf generate:[NSNumber numberWithInt:9]];
    
    XCTAssertEqual([result objectAtIndex:0], [NSNumber numberWithInt:3], @"First element should be 3");
    XCTAssertEqual([result objectAtIndex:1], [NSNumber numberWithInt:3], @"Second element should be 3");
    
}

@end


