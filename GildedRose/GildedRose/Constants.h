//
//  Constants.h
//  GildedRose
//
//  Created by Isil Demir on 1/27/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// General constant values
//
#define QUALITY_MAX 50  // An item cannot have quality greater than 50
#define QUALITY_MIN 0   // An item cannot have quality lesser than 0
#define SELL_IN_MIN 0   // You could decrease this if you wanted to sell items past their sell by dates ;)

//
// Item specific constants
//

// Regular Item
#define REGULAR_ITEM_QUALITY_CHANGE -1 // Decrease quality by 1 for Regular Items

// Aged Item
#define AGED_ITEM_QUALITY_CHANGE 1 // Increase quality by 1 for Aged items

// Legendary Item
#define LEGENDARY_ITEM_QUALITY_CHANGE -1 // Legendary items decrease in quality if sold

// Special Item
#define SPECIAL_ITEM_QUALITY_CHANGE 1 // Special Items increase in quality as time passes


@interface Constants : NSObject {
    
    NSDictionary *itemCatalogue;
    
}

@property (readonly) NSDictionary *itemCatalogue;

@end
