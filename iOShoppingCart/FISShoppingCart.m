//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart


- (NSUInteger )calculateTotalPriceInCents {
    NSUInteger totalPriceInCents = 0;
    for (FISItem *item in self.items) {
        totalPriceInCents += item.priceInCents;
    }
    return totalPriceInCents;
}

- (void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

- (void)removeItem:(FISItem *)item {
    NSUInteger index = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:index];
}


- (void)removeAllItemsLikeItem:(FISItem *)item {
    for (FISItem *itemInCart in [self.items copy]) {
        if ([itemInCart isEqual:item]) {
            NSUInteger index = [self.items indexOfObject:itemInCart];
            [self.items removeObjectAtIndex:index];
        }
    }
}

- (void)sortItemsByNameAsc {
    NSSortDescriptor *filter = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[filter]] mutableCopy];
}

- (void)sortItemsByNameDesc {
    NSSortDescriptor *filter = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[filter]] mutableCopy];
}

- (void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *filter = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[filter]] mutableCopy];
}

- (void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *filter = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[filter]] mutableCopy];
}

- (NSArray *)allItemsWithName:(NSString *)name {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSArray *allItemsWithName = [[self.items filteredArrayUsingPredicate:filter] mutableCopy];
    return allItemsWithName;
    
//    NSMutableArray *allItemsWithName = [[NSMutableArray alloc] init];
//    for (FISItem *itemInCart in self.items) {
//        if ([itemInCart.name isEqualToString:name]) {
//            [allItemsWithName addObject:itemInCart];
//        }
//    }
//    return allItemsWithName;
    
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)number {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"priceInCents >= %li", number];
    NSArray *allItemsWithMinimumPriceInCents = [self.items filteredArrayUsingPredicate:filter];
    return allItemsWithMinimumPriceInCents;
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)number {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"priceInCents <= %li", number];
    NSArray *allItemsWithMinimumPriceInCents = [self.items filteredArrayUsingPredicate:filter];
    return allItemsWithMinimumPriceInCents;
}

@end
