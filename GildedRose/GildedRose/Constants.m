//
//  Constants.m
//  GildedRose
//
//  Created by Isil Demir on 1/27/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Constants.h"

@interface Constants ()

    @property (readwrite) NSDictionary *itemCatalogue;

@end


@implementation Constants

@synthesize itemCatalogue;

-(id) init {
    
    self = [super init];
    
    self.itemCatalogue = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"REGULAR", @"+5 Dexterity Vest",
                          @"AGED", @"Aged Brie",
                          @"REGULAR", @"Elixir of the Mongoose",
                          @"LEGENDARY", @"Sulfuras, Hand of Ragnaros",
                          @"SPECIAL", @"Backstage passes to a TAFKAL80ETC concert",
                          @"CONJURED", @"Conjured Mana Cake",
                          nil];

    return self;    
}

@end
