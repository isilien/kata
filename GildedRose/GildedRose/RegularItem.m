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
        
        self.name = [item name];
        self.sellIn = [item sellIn];
        self.quality = [item quality];
        
        self.qualityChangeRate = REGULAR_ITEM_QUALITY_CHANGE; // Decrease quality by 1 for Regular Items
        
        if (self.sellIn <= SELL_IN_MIN) {
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
    if (self.quality > QUALITY_MIN) { // Quality is never zero
        self.quality += self.qualityChangeRate;
    }
    
    // Update sellIn
    self.sellIn--; // it's ok if sellIn is negative
    
    return [Item itemWithName:self.name sellIn:self.sellIn andQuality:self.quality];
    
}


@end
