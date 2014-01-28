//
//  GildedRose.m
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "GildedRose.h"

@implementation GildedRose

@synthesize items;

- (id) init {
    
    self = [super init];
    
    if (self) {
        NSArray *itemList = @[[Item itemWithName:@"+5 Dexterity Vest" sellIn:10 andQuality:20],
                       [Item itemWithName:@"Aged Brie" sellIn:2 andQuality:0],
                       [Item itemWithName:@"Elixir of the Mongoose" sellIn:5 andQuality:7],
                       [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:0 andQuality:80],
                       [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:15 andQuality:20],
                       [Item itemWithName:@"Conjured Mana Cake" sellIn:3 andQuality:6]];
        self.items = [NSMutableArray arrayWithArray:itemList];
    }
    return self;
}


- (void) updateQuality {
    
    NSDictionary *itemCatalogue = [[[Constants alloc] init] itemCatalogue];
    
    for (int i=0; i < [self.items count]; i++) {
        
        NSString *itemType = [itemCatalogue objectForKey:[self.items[i] name]];
        
        if ([itemType isEqualToString:@"REGULAR"]) {
            
            RegularItem *tmp = [[RegularItem alloc] initWithItem:self.items[i]];
            self.items[i] = [tmp updateStatus];
        }
        else if ([itemType isEqualToString:@"AGED"]) {
            
            AgedItem *tmp = [[AgedItem alloc] initWithItem:self.items[i]];
            self.items[i] = [tmp updateStatus];
        }
        else if ([itemType isEqualToString:@"LEGENDARY"]) {
            
            LegendaryItem *tmp = [[LegendaryItem alloc] initWithItem:self.items[i]];
            self.items[i] = [tmp updateStatus];
        }
        else if ([itemType isEqualToString:@"SPECIAL"]) {
            
            SpecialItem *tmp = [[SpecialItem alloc] initWithItem:self.items[i]];
            self.items[i] = [tmp updateStatus];
        }
        else if ([itemType isEqualToString:@"CONJURED"]) {
            
            ConjuredItem *tmp = [[ConjuredItem alloc] initWithItem:self.items[i]];
            self.items[i] = [tmp updateStatus];
        }
        
    }    
    
}



- (void) updateQuality_old {
    
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
