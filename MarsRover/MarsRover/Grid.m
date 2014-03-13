//
//  Grid.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Grid.h"

@interface Grid()

- (BOOL)validateGrid:(Grid *)grid;

@end

@implementation Grid

@synthesize width, height;

+ (Grid *)gridWithWidth:(int)width andHeight:(int)height {
    
    Grid *grid = [Grid new];
    grid.width = width;
    grid.height = height;
    
    if ([grid validateGrid:grid]) return grid;
    
    return nil;
}

- (BOOL)validateGrid:(Grid *)grid {
    
    // Either width or height need to be higher than 0 to have at least a 1-dimensional grid
    if (grid.width > 0 || grid.height > 0) return YES;
    
    return NO;
}

@end
