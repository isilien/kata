//
//  Item.h
//  GildedRose
//
//  Created by Isil Demir on 1/22/14.
//  Copyright (c) 2014 Isil Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject {
    
    NSString *name;
    int sellIn;
    int quality;
    
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic) int sellIn;
@property (nonatomic) int quality;

+(Item *) itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality;

@end
