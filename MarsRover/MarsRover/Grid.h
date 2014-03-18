//
//  Grid.h
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject {
    
    int width;
    int height;
    NSMutableArray *obstacles;
}

@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic, retain) NSMutableArray *obstacles;

+ (Grid *)gridWithWidth:(int)width andHeight:(int)height;

@end
