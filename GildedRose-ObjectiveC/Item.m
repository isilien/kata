//
//  Item.m
//  GildedRose-Objc
//
//  Created by Isil Demir on 1/24/14.
//
//

#import "Item.h"

@implementation Item 

@synthesize name, sellIn, quality;

+(Item *) itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality {
    
    Item *item = [Item new];
    item.name = name;
    item.sellIn = sellIn;
    item.quality = quality;
    
    return item;
    
}

@end
