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

-(double) calculatePrice:(NSArray *) books {
    
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
    
    return 0.0;
    
}


-(int) countBook:(NSMutableArray *) books withTitle:(NSString *) title {
    
    int count = 0;
    
    for (int i=0; i < [books count]; i++) {
        
        if ([books[i] isEqualToString:title]) {
            count++;
        }
    }
    
    return count;
}
    

@end
