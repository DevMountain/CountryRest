CountryRest
===========

An iOS app that uses the free restcountries.eu api.

###Step 1:
- Initialize pods to get a podfile
  - ```pod init```
- Add AFNetworking to the podfile
  - ```pod 'AFNetworking', '~> 2.3.1'```
- Run pod install command
  - ```pod install```
  
###Step 2:
- Add a network controller
  - Add a shared instance of AFHTTPSessionManager
    - Set the base URL to http://restcountries.eu/rest/v1/
    - Set the response serializer of the session manager to json
- Add an object controller
  - Use as a shared instance
- Add an object
  - Properties: name, capital, population
  - Add initWithDictionary
  
###Step 3:
- Add a getCountriesWithName: method with a completion handler
  - ```- (void)getCountriesWithName:(NSString *)name completion:(void (^)(NSArray *countries))completion;```
  - The method should call GET on the [NetworkController api] then parse the response

###Step 4:
- Add an interface to the viewController
  - IBOutlet for a textField in order to populate the search
  - IBAction to trigger the search from a button
    - In the search method call the getCountries method
    - You'll need to escape the string ```stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding```
  - IBOutlets for labels to display the country found (name, capital, population)
- In the completion of the search update the labels
