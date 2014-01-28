//
//  RegularItem.m
//  GildedRose
//
//  Created by Isil Demir on 1/24/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "RegularItem.h"

@implementation RegularItem

@synthesize qualityChangeRate;

- (id) initWithItem:(Item *)item {
    self = [super init];
    
    if (self) {
        
        self.qualityChangeRate = -1; // Decrease quality by 1 for Regular Items
        
        if (self.sellIn <= 0) {
            self.qualityChangeRate *= 2; // Quality of an item degrades twice as fast, if the sell by date (sellIn) has passed
        }

    }
    return self;
}

//
// At the end of each day, update an item's status
// by setting appropriate sellIn and quality values
//
- (Item *) updateStatus {
    
    // Update quality
    if (self.quality > 0) { // Quality is never zero
        self.quality -= self.qualityChangeRate;
    }
    
    // Update sellIn
    self.sellIn--; // it's ok if sellIn is negative
    
    return self;
    
}


@end
