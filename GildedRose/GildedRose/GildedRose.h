//
//  GildedRose.h
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GildedRose : NSObject {
    
    NSArray *items;
    
}

@property (nonatomic, retain) NSArray *items;

- (void) updateQuality;

@end
