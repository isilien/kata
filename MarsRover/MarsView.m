//
//  MarsView.m
//  MarsRover
//
//  Created by Isil Demir on 3/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "MarsView.h"


@implementation MarsView

@synthesize gridCoordinates, labelDirection, labelInstructions, startButton, rover, instructions, roverView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // Get the current graphics context (ie. where the drawing should appear)
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Coordinates for grid
    NSArray *coordinates = [self createCoordinatesForGrid];
    
    // Draw grid
    [self drawGridWithContext:context andCoordinates:coordinates];
    
    // Create rover at initial position
    if (self.rover == nil) {
        self.rover = [Rover roverWithCoordinate:[Coordinate coordinateWithX:0 andY:0] andDirection:[Direction directionWithDescription:@"N"] andGrid:[Grid gridWithWidth:9 andHeight:9 andObstacles:nil]];
    }
    
    //[self drawRoverWithContext:context andCoordinate:self.rover.coordinate];
    [self.labelDirection setText:self.rover.direction.description];
    
    if (self.instructions == nil) {
        self.instructions = @[@"f", @"f", @"r", @"f", @"f", @"l", @"f", @"f", @"r", @"f", @"f"];
        [self printInstructions];
    }

}

- (IBAction)startRover:(id)sender {

    [self followInstructions];
}

- (void)followInstructions {

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, (self.rover.coordinate.x + 1) * 32, 320 - ((self.rover.coordinate.y + 1) * 32));
    
    for (id instruction in self.instructions) {
        
        // Move the rover
        [self.rover move:@[ instruction ]];
        
        // Update direction label
        [self.labelDirection setText:self.rover.direction.description];
        
        // Redraw the view
        //[self setNeedsDisplay];
        
        CGPathAddLineToPoint(path, NULL, (self.rover.coordinate.x + 1) * 32, 320 - ((self.rover.coordinate.y + 1) * 32));
    }

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    animation.duration = 2.0;
    [animation setRemovedOnCompletion:NO];
    
    // Add the animation to the layer.
    [self.roverView.layer addAnimation:animation forKey:@"position"];
    
    // Set RoverView to the final position.
    CGPoint p;
    p.x = (self.rover.coordinate.x + 1) * 32;
    p.y = 320 - ((self.rover.coordinate.y + 1) * 32);
    self.roverView.layer.position = p;

}

- (void)printInstructions {
    
    NSString *label = @"";
    
    for (int i = 0; i < [self.instructions count]; i++) {
        label = [label stringByAppendingString:self.instructions[i]];
    }

    [self.labelInstructions setText:label];
}


- (void)drawRoverWithContext:(CGContextRef)context andCoordinate:(Coordinate *)coordinate {
    
    int x = (coordinate.x + 1) * 32;
    int y = (coordinate.y + 1) * 32;
    y = 320 - y;
    
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, 2.0);
    CGContextBeginPath(context);
    CGContextAddArc(context, x, y, 6, 0, 2 * M_PI, YES);
    CGContextClosePath(context);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0); // blue
    CGContextDrawPath(context, kCGPathFill);
    
    UIGraphicsPopContext();
}

- (void)drawGridWithContext:(CGContextRef)context andCoordinates:(NSArray *)coordinates {
    
    for (int i = 0; i < [coordinates count]; i++) {
        
        Coordinate *c = (Coordinate *)coordinates[i];
        int x = c.x;
        int y = c.y;
        
        UIGraphicsPushContext(context);
        
        // Set the width of the line
        CGContextSetLineWidth(context, 2.0);
        
        CGContextBeginPath(context);
        // context, x, y, radius, start_angle, end_angle, draw clockwise
        CGContextAddArc(context, x, y, 4, 0, 2 * M_PI, YES);
        CGContextClosePath(context);
        
        // RGBA
        CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
        
        // Fill
        CGContextDrawPath(context, kCGPathFill);
        
        UIGraphicsPopContext();
        
    }
    
}

- (NSArray *)createCoordinatesForGrid {
    
    NSMutableArray *coordinates = [NSMutableArray array];
    
    Coordinate *c = [Coordinate coordinateWithX:0 andY:0];
    
    int x = 0;
    int y = 32;
    
    // ith row, jth column
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            
            x += 32;
            
            c = [Coordinate coordinateWithX:x andY:y];
            [coordinates addObject:c];
        }
        
        x = 0;
        y += 32;
    }
    
    return [NSArray arrayWithArray:coordinates];
    
}

@end
