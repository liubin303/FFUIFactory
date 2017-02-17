//
//  UITextFieldSampleViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/26.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UITextFieldSampleViewController.h"
#import "FFUIFactory.h"
#import "Masonry.h"

@interface UITextFieldSampleViewController ()

@property (nonatomic, strong) UITextField *mobileTextFileld;

@end

@implementation UITextFieldSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mobileTextFileld];
}

- (UITextField *)mobileTextFileld{
    if (_mobileTextFileld == nil) {
        _mobileTextFileld = [UITextField ff_inputWithSize:CGSizeMake(200, 40) font:nil color:nil placeholder:@"请输入手机号码" adjustFont:YES minFont:11 maxLength:11 characterLimit:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]];
        _mobileTextFileld.borderStyle = UITextBorderStyleLine;
        _mobileTextFileld.ff_origin = CGPointMake((self.view.ff_width-200)/2, 100);
        __weak typeof(self) w_self = self;
        _mobileTextFileld.ff_format = ^NSString *(NSString *text){
            return [w_self formatString:text separatedByCharacter:' '];
        };
    }
    return _mobileTextFileld;
}

- (NSString *)formatString:(NSString *)string separatedByCharacter:(unichar)character {
    unichar sep = character;
    if (sep == 0) {
        sep = ' ';
    }
    NSUInteger len = [string length];
    
    @autoreleasepool {
        NSMutableString *format = [NSMutableString string];
        NSUInteger mask = 0;
        for (NSUInteger idx = 0; idx < len; idx++) {
            unichar c = [string characterAtIndex:idx];
            if (c < '0' || c > '9') {
                continue ;
            }
            
            mask++;
            [format appendFormat:@"%C",c];
            
            if (mask % 4 == 3 && idx + 1 < len) {
                [format appendFormat:@"%C",sep];
            }
        }
        
        return format;
    }
}
@end
