//
//  MarsView.h
//  MarsRover
//
//  Created by Isil Demir on 3/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rover.h"
#import "RoverView.h"

@interface MarsView : UIView {
    
    NSArray *gridCoordinates;
    NSArray *instructions;
    Rover *rover;
    IBOutlet UIView *roverView;
    //CGContextRef context;
    
    IBOutlet UILabel *labelDirection;
    IBOutlet UILabel *labelInstructions;
    IBOutlet UIButton *startButton;
}

@property (nonatomic, retain) NSArray *gridCoordinates;
@property (nonatomic, retain) Rover *rover;
@property (nonatomic, retain) NSArray *instructions;

@property (nonatomic, retain) IBOutlet UILabel *labelDirection;
@property (nonatomic, retain) IBOutlet UILabel *labelInstructions;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIView *roverView;
//@property (nonatomic) CGContextRef context;

- (IBAction)startRover:(id)sender;

@end
