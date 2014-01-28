//
//  ViewController.m
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
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
    
    GildedRose *gr = [[GildedRose alloc] init];
        
    NSLog(@"Initial list of items");
    
    for (id obj in gr.items) {
        
        NSLog(@"Name: %@", [obj name]);
        NSLog(@"Quality: %d", [obj quality]);
        NSLog(@"Sell In: %d", [obj sellIn]);
    }
		
    [gr updateQuality];

    NSLog(@"\n\nUpdated list of items");
    
    for (id obj in gr.items) {
        
        NSLog(@"Name: %@", [obj name]);
        NSLog(@"Quality: %d", [obj quality]);
        NSLog(@"Sell In: %d", [obj sellIn]);
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
