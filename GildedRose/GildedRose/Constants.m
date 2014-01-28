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
                          @"+5 Dexterity Vest", @"REGULAR",
                          @"Aged Brie", @"AGED",
                          @"Elixir of the Mongoose", @"REGULAR",
                          @"Sulfuras, Hand of Ragnaros", @"LEGENDARY",
                          @"Backstage passes to a TAFKAL80ETC concert", @"SPECIAL",
                          @"Conjured Mana Cake", @"CONJURED",
                          nil];

    return self;    
}

@end
