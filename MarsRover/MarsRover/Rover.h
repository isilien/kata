//
//  Rover.h
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinate.h"

@interface Rover : NSObject {
    
    NSString *direction;
    
    
}

+ (Rover *)roverWithCoordinate:(Coordinate *)coordinate andDirection:(Direction *)direction;

@end
