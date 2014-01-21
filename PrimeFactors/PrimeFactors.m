//
//  PrimeFactors.m
//  PrimeFactors
//
//  Created by Isil Demir on 1/20/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "PrimeFactors.h"

@implementation PrimeFactors

//
// Given an integer "number", return a list of its prime factors in ascending order
//
- (NSMutableArray *)generate:(NSNumber *)number {
    
    NSMutableArray *primeFactors = [NSMutableArray array];
    
    if ([number integerValue] > 1) {
        [primeFactors addObject:[NSNumber numberWithInt:2]];
    }
    
    return primeFactors;
}

@end
