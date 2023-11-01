//  ViewController.m
//  objective-c_hw5
//
//  Created by Eugene Zvyagin on 01.11.2023.
//

#import "ViewController.h"
#import "Loader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    [self performLoadingGetRequest];
}

- (void)performLoadingGetRequest{
    [self.loader perfomeGetRequests:@"https://postman-echo.com/get" argumets:@{@"ark1":@"wal1", @"ark2":@"wal2"} myblock:^(NSDictionary * dict, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error){
                NSLog(@"%@", error);
                return;
            }
           // NSLog(@"%@", dict);
            self.textView.text = [NSString stringWithFormat:@"%@", dict];
            
        });
    }];
}

@end
