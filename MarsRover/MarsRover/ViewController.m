//
//  ViewController.m
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Coordinate *coordinate = [Coordinate coordinateWithX:-10 andY:0];
	Rover *rover = [Rover roverWithCoordinate:coordinate andDirection:@"N"];
    
    NSLog(@"Rover: %@", rover);
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
