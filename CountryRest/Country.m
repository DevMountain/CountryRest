//
//  Country.m
//  CountryRest
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "Country.h"

static NSString * const nameKey = @"name";
static NSString * const capitalKey = @"capital";
static NSString * const populationKey = @"population";
static NSString * const regionKey = @"region";

@implementation Country

- (id)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {
        self.name = dictionary[nameKey];
        self.capital = dictionary[capitalKey];
        self.population = dictionary[populationKey];
        self.region = dictionary[regionKey];
    }
    return self;
}

@end
