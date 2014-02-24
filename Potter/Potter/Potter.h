//
//  Potter.h
//  Potter
//
//  Created by Isil Demir on 2/19/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Potter : NSObject {
    
    NSDictionary *prices;
    
}

@property (nonatomic, retain) NSDictionary *prices;

- (double)calculatePrice:(NSArray *) books;

@end
