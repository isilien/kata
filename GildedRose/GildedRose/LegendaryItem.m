//
//  LegendaryItem.m
//  GildedRose
//
//  Created by Isil Demir on 1/24/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "LegendaryItem.h"

@implementation LegendaryItem

@synthesize qualityChangeRate;

- (id) initWithItem:(Item *)item {
    self = [super init];
    
    if (self) {
        
        self.qualityChangeRate = LEGENDARY_ITEM_QUALITY_CHANGE; // If a Legendary Item is ever sold, their quality decreases        
    }
    return self;
}

//
// At the end of each day, update an item's status
// by setting appropriate sellIn and quality values
//
- (Item *) updateStatus {
    
    // Don't update sellIn since Legendary Items are never to be sold
    
    return self;
    
}


@end
