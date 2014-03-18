//
//  Direction.m
//  MarsRover
//
//  Created by Isil Demir on 3/17/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Direction.h"

@interface Direction()

- (BOOL)validateDirection:(Direction *) direction;

@end


@implementation Direction

@synthesize description;

+ (Direction *)directionWithDescription:(NSString *) description {
    
    Direction *direction = [Direction new];
    direction.description = [description uppercaseString];
    
    NSLog(@"direction: %@", direction.description);
    
    if ([direction validateDirection:direction]) return direction;
    
    return nil;
    
}

- (BOOL)validateDirection:(Direction *)direction {
    
    if ([direction.description isEqualToString:@"N"] || [direction.description isEqualToString:@"S"] || [direction.description isEqualToString:@"E"] || [direction.description isEqualToString:@"W"]) return YES;

    return NO;
}


@end
