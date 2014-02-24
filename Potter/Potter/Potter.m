//
//  Potter.m
//  Potter
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Potter.h"

@implementation Potter

@synthesize price;

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
    
    NSMutableArray *sets = [self findSubsetsWithCardinality:sortedBooks];
    
    
    
    
    
    return 0.0;
    
}


- (NSMutableArray *)findSubsetsWithCardinality:(NSMutableArray *) sortedBooks {
    
    NSMutableArray *sets = [NSMutableArray array];
    NSMutableArray *counts = [self countMap:sortedBooks];
    
    // If there are zeros in counts, reduce them
    counts = [self reduce:counts];
    
    while ([counts count] != 0) {
        
        int index = 0;
        NSMutableArray *current_set = [NSMutableArray array];
        
        for (int i = 0; i < [counts count]; i++) {
            
            [current_set addObject:[NSNumber numberWithInt:1]]; // Add any object to current set
            counts[index] = [NSNumber numberWithInt:(int)counts[i]-1]; // Decrement counts[i] object
            
            index++;
            
        } // end for
        
        // Add this subset's cardinality to sets
        [sets addObject:[NSNumber numberWithInt:[current_set count]]];
        
        // Reduce the new counts array
        counts = [self reduce:counts];
                
    } // end while
    
    return sets;
    
}


/**
 * Remove zeros from array
 */
- (NSMutableArray *) reduce:(NSMutableArray *) counts {
    
    NSMutableArray *reduced = [NSMutableArray array];
    
    for (int i = 0; i < [counts count]; i++) {
        
        if (![counts[i] isEqualToNumber:[NSNumber numberWithInt:0]]) {
            [reduced addObject:counts[i]];
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
    
    NSArray *map = @[ @(zeroCount), @(oneCount), @(twoCount), @(threeCount), @(fourCount) ];
    
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
