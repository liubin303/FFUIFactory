//
//  NSAttributedString+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/25.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "NSAttributedString+FFUIFactory.h"

@implementation NSAttributedString (FFUIFactory)

#pragma mark - private
+ (instancetype)ff_buildAttributedStringWithString:(NSString *)string
                                              font:(UIFont *)font
                                             color:(UIColor *)color
                                       lineSpacing:(CGFloat)lineSpacing
                                         underline:(BOOL)underline
                                     strikethrough:(BOOL)strikethrough {
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    if (font) { //设置字体
        [attributes setValue:font forKey:NSFontAttributeName];
    }
    if (color) {  //设置颜色
        [attributes setValue:color forKey:NSForegroundColorAttributeName];
    }
    if (underline) { //设置下划线
        [attributes setValue:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
    }
    if (strikethrough) { //设置中划线
        [attributes setValue:@(NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];
    }
    if (lineSpacing > 0.0f) { //调整段落样式
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        //段落样式
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        //默认是左对齐
        paragraphStyle.alignment = NSTextAlignmentLeft;
        //头部缩进，相当于左padding
        paragraphStyle.headIndent = 0;
        //尾部缩进，相当于左padding
        paragraphStyle.tailIndent = 0;
        //首行头缩进
        paragraphStyle.firstLineHeadIndent = 0;
        //段落后面的间距
        paragraphStyle.paragraphSpacing = 0;
        //段落之前的间距
        paragraphStyle.paragraphSpacingBefore = 0;
        //行间距
        paragraphStyle.lineSpacing = lineSpacing;
        //行间距倍数
        paragraphStyle.lineHeightMultiple = 1;
        [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    return [[[self class] alloc] initWithString:string attributes:attributes];
}

#pragma mark - public
- (CGSize)ff_sizeWithMaxWidth:(CGFloat)maxWidth {
    if (maxWidth <= 0) {
        maxWidth = [UIScreen mainScreen].bounds.size.width;
    }
    CGSize maxSize = CGSizeMake(maxWidth, 3000);
    CGRect rect = [self boundingRectWithSize:maxSize
                                     options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     context:nil];

    //取最大字体，去掉只有一行的时候的行间距
    __block UIFont *maxFont = nil;
    NSRange range = NSMakeRange(0, [self length]);
    [self enumerateAttribute:NSFontAttributeName inRange:range options:0 usingBlock:^(UIFont *font, NSRange range, BOOL *stop) {
        if (!maxFont || maxFont.pointSize < font.pointSize) {
            maxFont = font;
        }
    }];
    if (rect.size.height > maxFont.lineHeight && rect.size.height < 2*maxFont.lineHeight) {
        rect.size.height = maxFont.lineHeight;
    }
    return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
}

+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color {
    return [self ff_buildAttributedStringWithString:string
                                               font:font
                                              color:color
                                        lineSpacing:0
                                          underline:NO
                                      strikethrough:NO];
}

+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing {
    return [self ff_buildAttributedStringWithString:string
                                               font:font
                                              color:color
                                        lineSpacing:lineSpacing
                                          underline:NO
                                      strikethrough:NO];
}

+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing
                                    underline:(BOOL)underline {
    return [self ff_buildAttributedStringWithString:string
                                               font:font
                                              color:color
                                        lineSpacing:lineSpacing
                                          underline:underline
                                      strikethrough:NO];
}

+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing
                                strikethrough:(BOOL)strikethrough {
    return [self ff_buildAttributedStringWithString:string
                                               font:font
                                              color:color
                                        lineSpacing:lineSpacing
                                          underline:NO
                                      strikethrough:strikethrough];
}

@end
