//
//  PrimeFactorsTests.m
//  PrimeFactorsTests
//
//  Created by Isil Demir on 1/20/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <XCTest/XCTest.h>

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

// PrimeFactors method generate should return a non-empty array
- (void)testGenerateReturnsArray {
    
    PrimeFactors *pf = [[PrimeFactors alloc] init];
    NSNumber *testNumber = [NSNumber numberWithInt:8];
    
    NSMutableArray *result = [pf generate:testNumber];
    
    XCTAssertTrue([result isKindOfClass:[NSMutableArray class]], @"PrimeFactors class method generate returns an array");
    XCTAssertTrue([result count] > 0, @"Should return a non-empty array");
    
}

@end
