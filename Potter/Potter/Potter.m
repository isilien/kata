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

-(double) calculatePrice:(NSMutableArray *) books {
    
    if ([books count] == 0) {
        return self.price;
    }
    else {
        self.price = [self calculatePrice:books];
    }
    
    return -1;
    
}


// Return the number of books with a given index
-(int) countBookCount:(NSMutableArray *) books withTitle:(NSString *) title {
    
    return 0;
}


@end
