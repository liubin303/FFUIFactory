//
//  UIColor+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/12/20.
//
//

#import "UIColor+FFUIFactory.h"

@implementation UIColor (FFUIFactory)

+ (UIColor *)ff_colorWithHex:(NSInteger)hexValue{
    return [self ff_colorWithHex:hexValue alpha:1.0f];
}

+ (UIColor *)ff_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
    
}

+ (UIColor *)ff_colorWithHexString:(NSString *)hexString{
    NSString *colorString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    // 前缀check
    if ([hexString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    if ([hexString hasPrefix:@"0X"] || [hexString hasPrefix:@"0x"]) {
        colorString = [colorString substringFromIndex:2];
    }

    // 内容及长度check
    if ([colorString rangeOfString:@"(^[0-9A-Fa-f]$)" options:NSRegularExpressionSearch].length != NSNotFound && colorString.length >= 6) {
        NSString *redStr = [colorString substringWithRange:NSMakeRange(0,2)];
        NSString *greenStr = [colorString substringWithRange:NSMakeRange(2, 2)];
        NSString *blueStr = [colorString substringWithRange:NSMakeRange(4, 2)];
        NSString *alphaStr = [colorString substringFromIndex:6];

        unsigned redInt = 0;
        unsigned greenInt = 0;
        unsigned blueInt = 0;
        CGFloat alphaValue = alphaStr.length > 0 ? alphaStr.floatValue/255.0f : 1;
        
        [[NSScanner scannerWithString:redStr] scanHexInt:&redInt];
        [[NSScanner scannerWithString:greenStr] scanHexInt:&greenInt];
        [[NSScanner scannerWithString:blueStr] scanHexInt:&blueInt];
        return [UIColor colorWithRed:redInt / 255.0 green:greenInt / 255.0 blue:blueInt / 255.0 alpha:alphaValue];
    }
    return nil;
}

@end
