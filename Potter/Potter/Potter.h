//
//  Potter.h
//  Potter
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Potter : NSObject {
    
    double price;
    
}

@property (nonatomic) double price;

-(double) calculatePrice:(NSMutableArray *) books;

-(int) countBookCount:(NSMutableArray *) books withTitle:(NSString *) title;

@end
