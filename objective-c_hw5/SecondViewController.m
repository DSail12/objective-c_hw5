//  SecondViewController.m
//  objective-c_hw5
//
//  Created by Eugene Zvyagin on 01.11.2023.
//

//#import "SecondViewController.h"
//#import "Loader.h"
//
//@interface SecondViewController ()
//
//@end
//
//@implementation SecondViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.loader = [Loader new];
//    [self performLoadingPostRequest];
//}
//
//- (void)performLoadingPostRequest {
//    [self.loader perfomePostRequests:@"https://postman-echo.com/post" argumets:@{@"ark1":@"wal1", @"ark2":@"wal2"} myblock:^(NSDictionary *dict, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (error) {
//                NSLog(@"%@", error);
//                return;
//            }
//            NSLog(@"%@", dict);
//            // Update the TextView with the received data
//            //self.text3 = [NSString stringWithFormat:@"%@", dict];
//        });
//    }];
//}
//
//- (IBAction)post:(id)sender {
//    [self performLoadingPostRequest];
//}
//
//- (IBAction)text3:(id)sender {
//    //self.text3.text = @"Text 3";
//}
//
//- (IBAction)text2:(id)sender {
//   // self.textView.text = @"Text 2";
//}
//
//@end
