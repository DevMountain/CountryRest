//
//  CountryController.m
//  CountryRest
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CountryController.h"

static NSString * const kAPIURL = @"http://restcountries.eu/rest/v1/";


@implementation CountryController

+ (CountryController *)sharedInstance {
    static CountryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CountryController new];
    });
    return sharedInstance;
}

- (void)retrieveCountriesWithName:(NSString *)name completion:(void (^)(NSArray *countries))completion {

	name = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URLWithPath = [NSURL URLWithString:[NSString stringWithFormat:@"%@name/%@", kAPIURL, name]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URLWithPath completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *dataTaskError;
        
        NSArray *responseCountries = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            NSLog(@"%@", dataTaskError);
            
            completion(nil);
        } else {
            NSMutableArray *countries = [NSMutableArray new];
            for (NSDictionary *dictionary in responseCountries) {
                [countries addObject:[[Country alloc] initWithDictionary:dictionary]];
            }
            
            completion(countries);
        }
    }];
    
    [task resume];
}

@end
