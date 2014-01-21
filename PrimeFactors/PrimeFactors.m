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
    
    if ([number integerValue] > 1) {
        
        int quotient = [number integerValue];
            
        while (quotient%2 == 0) {
            [primeFactors addObject:[NSNumber numberWithInt:2]];
            quotient /= 2;
            number = [NSNumber numberWithInt:quotient];
        }
        
        if (quotient > 1) {            
            [primeFactors addObject:[NSNumber numberWithInt:quotient]];
        }

        
        
        
        
        
        
    }
    
    return primeFactors;
}

@end
