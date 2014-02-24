//
//  ViewController.m
//  Potter
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    int zeroCount = 0;
    int oneCount = 1;
    int twoCount = 2;
    int threeCount = 3;
    int fourCount = 4;
    
    NSArray *map = @[ @(zeroCount), @(oneCount), @(twoCount), @(threeCount), @(fourCount) ];
    
    NSLog(@"map: %@", [map description]);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
