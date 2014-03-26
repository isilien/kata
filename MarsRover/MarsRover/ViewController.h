//
//  ViewController.h
//  MarsRover
//
//  Created by Isil Demir on 3/12/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rover.h"
#import "MarsView.h"

@interface ViewController : UIViewController {
    
    IBOutlet UIView *marsView;
    
}

@property (nonatomic, retain) IBOutlet UIView *marsView;

@end
