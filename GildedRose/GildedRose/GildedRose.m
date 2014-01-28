//
//  GildedRose.m
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "GildedRose.h"
#import "Item.h"

@implementation GildedRose

@synthesize items;

- (id) init {
    
    self = [super init];
    
    if (self) {
        self.items = @[[Item itemWithName:@"+5 Dexterity Vest" sellIn:10 andQuality:20],
                       [Item itemWithName:@"Aged Brie" sellIn:2 andQuality:0],
                       [Item itemWithName:@"Elixir of the Mongoose" sellIn:5 andQuality:7],
                       [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:0 andQuality:80],
                       [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:15 andQuality:20],
                       [Item itemWithName:@"Conjured Mana Cake" sellIn:3 andQuality:6]];
    }
    
    return self;
    
}

- (void) updateQuality {
    
    for (int i=0; i < [self.items count]; i++) {
        if (![[self.items[i] name] isEqualToString:@"Aged Brie"] && ![[self.items[i] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
            if ([self.items[i] quality] > 0) {
                if (![[self.items[i] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
                    [self.items[i] setQuality:[self.items[i] quality] - 1];
                }
            }
        }
        else {
            if ([self.items[i] quality] < 50) {
                [self.items[i] setQuality:[self.items[i] quality] + 1 ];
                if ([[self.items[i] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
                    if ([self.items[i] sellIn] < 11) {
                        if ([self.items[i] quality] < 50) {
                            [self.items[i] setQuality:[self.items[i] quality] + 1];
                        }
                    }
                    if ([self.items[i] sellIn] < 6) {
                        
                        if ([self.items[i] quality] < 50) {
                            [self.items[i] setQuality:[self.items[i] quality] + 1];
                        }
                    }
                }
            }
        }
        if (![[self.items[i] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
            [self.items[i] setSellIn:[self.items[i] sellIn] - 1];
        }
        if ([self.items[i] sellIn] < 0) {
            if (![[self.items[i] name] isEqualToString:@"Aged Brie"]) {
                if (![[self.items[i] name] isEqualToString:@"Backstage passes to a TAFKAL80ETC concert"]) {
                    if ([self.items[i] quality] > 0) {
                        if (![[self.items[i] name] isEqualToString:@"Sulfuras, Hand of Ragnaros"]) {
                            [self.items[i] setQuality:[self.items[i] quality] - 1];
                        }
                    }
                }
                else {
                    [self.items[i] setQuality:[self.items[i] quality] - [self.items[i] quality]];
                }
            }
            else {
                if ([self.items[i] quality] < 50) {
                    [self.items[i] setQuality:[self.items[i] quality] + 1];
                }
            }
        }
    }
    
}


@end
