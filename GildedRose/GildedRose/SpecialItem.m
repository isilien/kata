//
//  SpecialItem.m
//  GildedRose
//
//  Created by Isil Demir on 1/27/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "SpecialItem.h"

@implementation SpecialItem

@synthesize qualityChangeRate;

- (id) initWithItem:(Item *)item {
    self = [super init];
    
    if (self) {
        
        // Quality increases by 2 if there are 10 days or less
        if (self.sellIn <= 10) {
            self.qualityChangeRate = 2;
        }
        // Quality increases by 3 if there are 5 days or less
        else if (self.sellIn <= 5) {
            self.qualityChangeRate = 3;
        }
        else {
            self.qualityChangeRate = SPECIAL_ITEM_QUALITY_CHANGE; // Special Items increase in quality in time
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
    if (self.sellIn < 0) { // Quality drops to zero after concert (sellIn = 0 is the day of the concert)
        self.quality = 0;
    }
    else if (self.quality < QUALITY_MAX) { // Quality is never over 50
        self.quality += self.qualityChangeRate;
    }
    
    self.sellIn--; // it's ok if sellIn is negative
    
    return self;
    
}

@end
