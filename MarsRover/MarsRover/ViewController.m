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
    
    Grid *grid = [Grid gridWithWidth:10 andHeight:10];
    Coordinate *coordinate = [Coordinate coordinateWithX:0 andY:0];
    Direction *direction = [Direction directionWithDescription:@"N"];
    
    Rover *curiosity = [Rover roverWithCoordinate:coordinate andDirection:direction andGrid:grid];
    
    NSArray *instructions = @[@"f", @"f", @"r", @"f", @"f"];
    
    [curiosity move:instructions];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
