//
//  PrimeFactors.m
//  PrimeFactors
//
//  Created by Isil Demir on 1/20/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "PrimeFactors.h"

@implementation PrimeFactors

- (NSMutableArray *)generate:(NSNumber *)number {
    
    NSMutableArray *result = [NSMutableArray array];
    
    if ([number integerValue] > 1) {
        [result addObject:[NSNumber numberWithInt:2]];
    }
    
    return result;
}

@end
