//
//  Potter.m
//  Potter
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Potter.h"

@implementation Potter

@synthesize prices;

- (id)init {
    
    self = [super init];
    
    if (self) {
        // Price values for each subset of books with x cardinality
        self.prices = [NSDictionary dictionaryWithObjectsAndKeys:
                       @(8.0), @"1",
                       @(15.2), @"2",
                       @(21.6), @"3",
                       @(25.6), @"4",
                       @(30.0), @"5",
                       nil];
    }
    
    return self;
}

- (double)calculatePrice:(NSArray *) books {
    
    // Empty basket
    if ([books count] == 0) {
        return 0.0;
    }
    
    // One book in the basket
    if ([books count] == 1) {
        return 8.0;
    }
    
    // One type of book in the basket, many books
    int max = [[books valueForKeyPath:@"@max.intValue"] intValue];
    int min = [[books valueForKeyPath:@"@min.intValue"] intValue];
    if (max == min) {
        return 8.0 * [books count];
    }
    
    // Assorted books in basket
    //
    NSMutableArray *sortedBooks = [NSMutableArray arrayWithArray:[self sortArrayOfNumbers:books]];
    
    NSMutableArray *subsets = [self findSubsetsWithCardinality:sortedBooks];
    
    subsets = [self replacements:subsets];
    
    double price = 0.0;
    
    for (int i = 0; i < [subsets count]; i++) {
        
        price += [[prices valueForKey:[subsets[i] stringValue]] doubleValue];
    }

    return price;    
}


- (NSMutableArray *)findSubsetsWithCardinality:(NSMutableArray *) sortedBooks {
    
    NSMutableArray *sets = [NSMutableArray array];
    NSMutableArray *counts = [self countMap:sortedBooks];
    
    counts = [self reduce:counts];
    
    while ([counts count] != 0) {
        
        int index = 0;
        NSMutableArray *current_set = [NSMutableArray array];
        
        for (int i = 0; i < [counts count]; i++) {
            
            [current_set addObject:[NSNumber numberWithInt:1]]; // Add any object to current set
            counts[index] = [NSNumber numberWithInt:([counts[i] integerValue]-1)]; // Book placed in a subset, decrement count
            
            index++;
        }

        // Add this subset's cardinality to sets
        [sets addObject:[NSNumber numberWithInt:[current_set count]]];
        
        counts = [self reduce:counts];
    }
    
    return sets;
}

/**
 * Replace all (5+3) subsets with (4+4) subsets
 */
- (NSMutableArray *) replacements:(NSMutableArray *)cardinalities {
    
    NSMutableArray *replaced = cardinalities;
    
    while ([cardinalities containsObject:[NSNumber numberWithInt:3]] && [cardinalities containsObject:[NSNumber numberWithInt:5]]) {
        
        // Find indices for 3 and 5
        int indexOfThree = [cardinalities indexOfObject:[NSNumber numberWithInt:3]];
        int indexOfFive = [cardinalities indexOfObject:[NSNumber numberWithInt:5]];
        
        replaced[indexOfThree] = [NSNumber numberWithInt:4];
        replaced[indexOfFive] = [NSNumber numberWithInt:4];
    }
    return replaced;
}


/**
 * Remove zeros from array
 */
- (NSMutableArray *) reduce:(NSMutableArray *) counts {
    
    NSMutableArray *reduced = [NSMutableArray array];
    
    for (int i = 0; i < [counts count]; i++) {
        
        if (![counts[i] isEqualToNumber:[NSNumber numberWithInt:0]]) {
            [reduced addObject:(NSNumber *)counts[i]];
        }
    }
    return reduced;
}

/**
 * Given a list of sorted books
 * Return how may of each type
 * [ 0, 2, 4, 1, 5 ] means 0 books of Type 0, 2 books of Type 1, ...
 */
- (NSMutableArray *) countMap:(NSMutableArray *) sortedBooks {
    
    int zeroCount = [self countWithin:sortedBooks withIndex:0];
    int oneCount = [self countWithin:sortedBooks withIndex:1];
    int twoCount = [self countWithin:sortedBooks withIndex:2];
    int threeCount = [self countWithin:sortedBooks withIndex:3];
    int fourCount = [self countWithin:sortedBooks withIndex:4];
    
    NSArray *map = @[ [NSNumber numberWithInt:zeroCount],
                      [NSNumber numberWithInt:oneCount],
                      [NSNumber numberWithInt:twoCount],
                      [NSNumber numberWithInt:threeCount],
                      [NSNumber numberWithInt:fourCount] ];
    
    return [NSMutableArray arrayWithArray:map];
}

/**
 * Count of a book of a particular index. Ex: Count of all the "Chamber of Secret" tomes.
 */
- (int)countWithin:(NSMutableArray *)books withIndex:(int) index {
    
    int count = 0;
    
    for (int i=0; i < [books count]; i++) {
        if ([books[i] isEqualToNumber:[NSNumber numberWithInt:index]]) count++;
    }
    
    return count;
}


- (NSArray *)sortArrayOfNumbers:(NSArray *) input {
    
    return [input sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)reverseSortArray:(NSArray *) input {
    
    return [[input reverseObjectEnumerator] allObjects];
}
    

@end
