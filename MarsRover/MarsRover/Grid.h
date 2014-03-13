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
}

@property (nonatomic) int width;
@property (nonatomic) int height;

+ (Grid *)gridWithWidth:(int)width andHeight:(int)height;

@end
