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

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Potter *harry = [[Potter alloc] init];
    NSArray *books = @[ @0, @0, @1, @2, @2, @3 ];
    
    double price = [harry calculatePrice:books];
    
    NSLog(@"Price: %f", price);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
