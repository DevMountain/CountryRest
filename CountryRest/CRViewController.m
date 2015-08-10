//
//  CRViewController.m
//  CountryRest
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CRViewController.h"
#import "CountryController.h"

@interface CRViewController ()

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *capitalLabel;
@property (nonatomic, strong) IBOutlet UILabel *populationLabel;

@end

@implementation CRViewController

- (IBAction)search:(id)sender {
	
	NSString *countryName = self.nameField.text;
    [[CountryController sharedInstance] retrieveCountriesWithName:countryName completion:^(NSArray *countries) {
		
        Country *firstCountry = countries.firstObject;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.nameLabel.text = firstCountry.name;
            self.capitalLabel.text = firstCountry.capital;
            self.populationLabel.text = [NSString stringWithFormat:@"%@", firstCountry.population];
        });
        
    }];

}

@end
