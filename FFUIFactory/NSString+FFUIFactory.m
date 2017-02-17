//
//  NSString+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/25.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "NSString+FFUIFactory.h"

@implementation NSString (FFUIFactory)

- (CGSize)ff_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    
    CGSize maxSize = CGSizeMake(maxWidth, 3000);
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSDictionary *attributes = @{ NSFontAttributeName:font };
        CGRect rect = [self boundingRectWithSize:maxSize
                                         options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attributes
                                         context:nil];
        return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
    CGSize size = [self sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    return CGSizeMake(ceil(size.width), ceil(size.height));
#pragma clang diagnostic pop
}

- (NSString *)ff_substringMeetCharacterSet:(NSCharacterSet *)set {
    if (!set) {
        return [self copy];
    }
    @autoreleasepool {
        NSMutableString *sub = [NSMutableString string];
        NSString *text = [self copy];
        for (NSUInteger index = 0; index < [text length];index++) {
            unichar c = [text characterAtIndex:index];
            if ([set characterIsMember:c]) {
                [sub appendFormat:@"%C",c];
            }
        }
        return [sub copy];
    }
}


@end
