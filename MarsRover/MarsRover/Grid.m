//
//  Grid.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Grid.h"

@interface Grid()

- (BOOL)validateGrid;

@end

@implementation Grid

@synthesize width, height, obstacles;

+ (Grid *)gridWithWidth:(int)width andHeight:(int)height {
    
    Grid *grid = [Grid new];
    grid.width = width;
    grid.height = height;
    
    if ([grid validateGrid]) {
        
        [grid addObstacles];
        return grid;
    }
    
    return nil;
}

- (BOOL)validateGrid {
    
    // Grid must have positive width and height
    if (self.width > 0 && self.height > 0) return YES;
    
    return NO;
}


//
// Randomly create 5 obstacles and place them in the grid
//
- (void)addObstacles {
    
    int randomX = 0;
    int randomY = 0;
    
    for (int i = 0; i < 5; i++) {
        
        randomX = arc4random() % self.width;
        randomY = arc4random() % self.height;
        
        [self.obstacles addObject:@[ [NSNumber numberWithInt:randomX], [NSNumber numberWithInt:randomY] ] ];
    }
    
}

@end
