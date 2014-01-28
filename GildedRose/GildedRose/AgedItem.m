//
//  AgedItem.m
//  GildedRose
//
//  Created by Isil Demir on 1/27/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "AgedItem.h"

@implementation AgedItem

@synthesize qualityChangeRate;

- (id) initWithItem:(Item *)item {
    self = [super init];
    
    if (self) {
        
        self.name = [item name];
        self.sellIn = [item sellIn];
        self.quality = [item quality];
        
        self.qualityChangeRate = AGED_ITEM_QUALITY_CHANGE; // AgedItems increase in quality as time goes by
    }
    return self;
}

//
// At the end of each day, update an item's status
// by setting appropriate sellIn and quality values
//
- (Item *) updateStatus {
    
    // Update quality
    if (self.quality < QUALITY_MAX) { 
        self.quality += self.qualityChangeRate;
    }
    
    // Update sellIn
    self.sellIn--; // it's ok if sellIn is negative
    
    return self;
    
}

@end
