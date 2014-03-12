//
//  Coordinate.h
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coordinate : NSObject {
    
    int x;
    int y;
}

@property (nonatomic) int x;
@property (nonatomic) int y;

+ (Coordinate *)coordinateWithX:(int)x andY:(int)y;

@end
