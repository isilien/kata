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
// Return an empty array if the given integer has no prime factors
//
- (NSMutableArray *)generate:(NSNumber *)number {
    
    NSMutableArray *primeFactors = [NSMutableArray array];
    
    int quotient = [number integerValue];
    int divisor = 2; // first prime divisor
    
    while (quotient > 1) {
        
        while (quotient % divisor == 0) {
            [primeFactors addObject:[NSNumber numberWithInt:divisor]];
            quotient /= divisor;
        }
        divisor++;

    }
    
    return primeFactors;
}

@end
