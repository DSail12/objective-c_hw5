//  Loader.m
//  objective-c_hw5
//
//  Created by Eugene Zvyagin on 01.11.2023.
//

#import "Loader.h"

@implementation Loader

- (NSURLSession*) session{
    if (!_session){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPAdditionalHeaders = @{@"Content-Type":@"application/json", @"Accept":@"application/json", @"user-agent":@"iPhone15"};
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _session;
}

- (NSData*)dataWithJson:(NSDictionary *)jsonDict error:(NSError**)error {
    return [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:error];
}

- (NSDictionary *)parseJsonData:(NSData *)data error:(NSError**)error {
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}

- (void)perfomeGetRequests:(NSString *)stringUrl argumets:(NSDictionary *)arguments myblock:(void (^)(NSDictionary* , NSError*))block {
    NSURLComponents* urlComponents = [NSURLComponents componentsWithString:stringUrl];
    if (arguments){
        NSMutableArray <NSURLQueryItem*>* queryItems = [NSMutableArray new];
        for (NSString* key in arguments.allKeys){
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:arguments [key]]];
        }
        urlComponents.queryItems = [queryItems copy];
    }
    NSURL *url = urlComponents.URL;
    NSURLSessionDataTask* dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            block(nil, error);
            return;
        }
        NSError* parsingError;
        NSDictionary* dict = [self parseJsonData:data error:&parsingError];
        if (parsingError){
            block(nil, parsingError);
            return;
        }
        block(dict, nil);
    }];
    [dataTask resume];
}

- (void)perfomePostRequests:(NSString *)stringUrl argumets:(NSDictionary *)arguments myblock:(void (^)(NSDictionary*, NSError*))block {
    NSURL *url = [NSURL URLWithString:stringUrl];
    
    // Create the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    // Set the request headers
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"iPhone15" forHTTPHeaderField:@"user-agent"];
    
    // Convert the arguments dictionary to JSON data
    NSError *jsonError;
    NSData *jsonData = [self dataWithJson:arguments error:&jsonError];
    if (jsonError) {
        block(nil, jsonError);
        return;
    }
    
    // Set the request body
       request.HTTPBody = jsonData;
       
       // Perform the POST request
       NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           if (error) {
               block(nil, error);
               return;
           }
           
           // Parse the response data
           NSError *parsingError;
           NSDictionary *dict = [self parseJsonData:data error:&parsingError];
           if (parsingError) {
               block(nil, parsingError);
               return;
           }
           
           block(dict, nil);
       }];
       
       [dataTask resume];
   }


   @end
