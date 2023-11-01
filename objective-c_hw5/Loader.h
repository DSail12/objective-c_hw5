//  Loader.h
//  objective-c_hw5
//
//  Created by Eugene Zvyagin on 01.11.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject

@property(nonatomic) NSURLSession* session;

-(void)perfomeGetRequests:(NSString*) stringUrl argumets:(NSDictionary*) arguments myblock:(void(^)(NSDictionary*, NSError*)) block;
-(void)perfomePostRequests:(NSString*) stringUrl argumets:(NSDictionary*) arguments myblock:(void(^)(NSDictionary*, NSError*)) block;
-(NSDictionary*)parseJsonData:(NSData*) data error:(NSError**) error;
-(NSData*)dataWithJson:(NSDictionary*) jsonDict error:(NSError**) error;

@end

NS_ASSUME_NONNULL_END
