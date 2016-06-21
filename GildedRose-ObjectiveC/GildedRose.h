//
//  GildedRose.h
//  GildedRose-Objc
//
//  Created by Isil Demir on 1/24/14.
//
//

#import <Foundation/Foundation.h>

@interface GildedRose : NSObject {
    
    NSArray *items;
    
}

@property (nonatomic, retain) NSArray *items;

- (void) updateQuality;

@end
