//  ViewController.h
//  objective-c_hw5
//
//  Created by Eugene Zvyagin on 01.11.2023.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property(nonatomic) Loader* loader;

@end
