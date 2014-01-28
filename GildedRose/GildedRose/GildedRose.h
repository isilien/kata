//
//  GildedRose.h
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Item.h"
#import "Constants.h"
#import "RegularItem.h"
#import "AgedItem.h"
#import "LegendaryItem.h"
#import "ConjuredItem.h"
#import "SpecialItem.h"

@interface GildedRose : NSObject {
    
    NSMutableArray *items;
    
}

@property (nonatomic, retain) NSMutableArray *items;

- (void) updateQuality_old;
- (void) updateQuality;

@end
