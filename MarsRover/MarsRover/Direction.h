//
//  Direction.h
//  MarsRover
//
//  Created by Isil Demir on 3/17/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Direction : NSObject {
    
    NSString *description;
}

@property (nonatomic, retain) NSString *description;

+ (Direction *)directionWithDescription:(NSString *) description;

@end
