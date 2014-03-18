//
//  Direction.m
//  MarsRover
//
//  Created by Isil Demir on 3/17/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Direction.h"

@interface Direction()

- (BOOL)validateDirection;

@end


@implementation Direction

@synthesize description;

+ (Direction *)directionWithDescription:(NSString *) description {
    
    Direction *direction = [Direction new];
    direction.description = [description uppercaseString];
    
    if ([direction validateDirection]) return direction;
    
    return nil;
    
}

- (BOOL)validateDirection {
    
    if ([self.description isEqualToString:@"N"] || [self.description isEqualToString:@"S"] || [self.description isEqualToString:@"E"] || [self.description isEqualToString:@"W"]) return YES;

    return NO;
}


@end
