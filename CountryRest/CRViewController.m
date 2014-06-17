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

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)search:(id)sender {
    
    [[CountryController sharedInstance] getCountriesWithName:[self.nameField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:^(NSArray *countries) {
        
        Country *firstCountry = countries.firstObject;
        
        self.nameLabel.text = firstCountry.name;
        self.capitalLabel.text = firstCountry.capital;
        self.populationLabel.text = [NSString stringWithFormat:@"%@", firstCountry.population];
        
    }];

}

@end
