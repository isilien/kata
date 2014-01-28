//
//  RegularItem.h
//  GildedRose
//
//  Created by Isil Demir on 1/24/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import "Item.h"

#import "Constants.h"

@interface RegularItem : Item {
    
    int qualityChangeRate;
    
}

@property (nonatomic) int qualityChangeRate;

- (id) initWithItem:(Item *)item;
- (Item *) updateStatus;

@end
