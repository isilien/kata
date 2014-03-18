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
- (NSArray *)createRandomObstacles;

@end

@implementation Grid

@synthesize width, height, obstacles;

+ (Grid *)gridWithWidth:(int)width andHeight:(int)height andObstacles:(NSArray *) obstacles {
    
    Grid *grid = [Grid new];
    grid.width = width;
    grid.height = height;
    grid.obstacles = obstacles;
    
    if ([grid validateGrid]) {
        
        //if (obstacles == nil) grid.obstacles = [grid createRandomObstacles];
        
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
- (NSArray *)createRandomObstacles {
    
    NSMutableArray *obs = [NSMutableArray array];
    int randomX = 0;
    int randomY = 0;
    
    for (int i = 0; i < 5; i++) {
        
        randomX = arc4random() % self.width;
        randomY = arc4random() % self.height;
        
        [obs addObject:@[ [NSNumber numberWithInt:randomX], [NSNumber numberWithInt:randomY] ] ];
    }
    
    return [NSArray arrayWithArray:obs];
    
}

@end
