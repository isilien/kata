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
    
    // No books
    NSArray *books = [NSArray array];
    XCTAssertEqualWithAccuracy(0, [harry calculatePrice:books], ACCURACY);
    
    // One type of book: Type 0
    books = @[ @0 ];
    XCTAssertEqualWithAccuracy(8.0, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @1 ];
    XCTAssertEqualWithAccuracy(8.0, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @2 ];
    XCTAssertEqualWithAccuracy(8.0, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @3 ];
    XCTAssertEqualWithAccuracy(8.0, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @4 ];
    XCTAssertEqualWithAccuracy(8.0, [harry calculatePrice:books], ACCURACY);
    
    // One type of book, many books
    books = @[ @0, @0 ];
    XCTAssertEqualWithAccuracy(8.0 * 2, [harry calculatePrice:books], ACCURACY);

    books = @[ @1, @1, @1 ];
    XCTAssertEqualWithAccuracy(8.0 * 3, [harry calculatePrice:books], ACCURACY);
    
}

- (void)testSimpleDiscounts {
    
    Potter *harry = [[Potter alloc] init];
    
    NSArray *books = @[ @0, @1 ];
    XCTAssertEqualWithAccuracy(8 * 2 * 0.95, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @2, @4 ];
    XCTAssertEqualWithAccuracy(8 * 3 * 0.9, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @1, @2, @4 ];
    XCTAssertEqualWithAccuracy(8 * 4 * 0.8, [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @1, @2, @3, @4 ];
    XCTAssertEqualWithAccuracy(8 * 5 * 0.75, [harry calculatePrice:books], ACCURACY);
    
}

- (void)testSeveralDiscounts {
    
    Potter *harry = [[Potter alloc] init];
    
    NSArray *books = @[ @0, @0, @1 ];
    XCTAssertEqualWithAccuracy(8 + (8 * 2 * 0.95), [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @0, @1, @1 ];
    XCTAssertEqualWithAccuracy(2 * (8 * 2 * 0.95), [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @0, @1, @2, @2, @3 ];
    XCTAssertEqualWithAccuracy((8 * 4 * 0.8) + (8 * 2 * 0.95), [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @1, @1, @2, @3, @4 ];
    XCTAssertEqualWithAccuracy(8 + (8 * 5 * 0.75), [harry calculatePrice:books], ACCURACY);
    
}

- (void)testEdgeCases {
    
    Potter *harry = [[Potter alloc] init];
    
    NSArray *books = @[ @0, @0, @1, @1, @2, @2, @3, @4 ];
    XCTAssertEqualWithAccuracy(2 * (8 * 4 * 0.8), [harry calculatePrice:books], ACCURACY);
    
    books = @[ @0, @0, @0, @0, @0, @1, @1, @1, @1, @1, @2, @2, @2, @2, @3, @3, @3, @3, @3, @4, @4, @4, @4 ];
    XCTAssertEqualWithAccuracy(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8), [harry calculatePrice:books], ACCURACY);
    
}



@end
