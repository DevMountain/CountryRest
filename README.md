CountryRest
===========

An iOS app that uses the free restcountries.eu api.

###Step 1:
- Initialize pods to get a podfile
  - ```pod init```
- Add AFNetworking to the podfile
  - ```pod 'SVProgressHUD'```
- Run pod install command
  - ```pod install```
  
###Step 2:
- Add an object
  - Properties: name, capital, population
  - Add initWithDictionary
- Add a CountryController
- Add a getCountriesWithName: method with a completion handler
  - ```- (void)getCountriesWithName:(NSString *)name completion:(void (^)(NSArray *countries))completion;```
  - The method should create an NSURLSessionDataTask and then parse the response

###Step 4:
- Add an interface to the viewController
  - IBOutlet for a textField in order to populate the search
  - IBAction to trigger the search from a button
    - Trigger SVProgressHUD to display
    - In the search method call the getCountries method
    - You'll need to escape the string ```stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding```
  - IBOutlets for labels to display the country found (name, capital, population)
- In the completion of the search update the labels and turn off the SVProgressHUD display
