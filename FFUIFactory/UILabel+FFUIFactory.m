//
//  UILabel+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UILabel+FFUIFactory.h"
#import "NSObject+AssociatedObjects.h"
#import "NSAttributedString+FFUIFactory.h"
#import "NSString+FFUIFactory.h"

@implementation UILabel (FFUIFactory)

#pragma mark - private
+ (instancetype)ff_buildWithMinWidth:(CGFloat)minWidth
                            maxWidth:(CGFloat)maxWidth
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                      backgroudColor:(UIColor *)backgroudColor
                           alignment:(NSTextAlignment)alignment
                       numberOfLines:(NSInteger)lines {
    if (minWidth < 0 || maxWidth < 0) {
        NSAssert(NO, @"宽度不能小于0");
        return nil;
    }
    
    if (minWidth > maxWidth) {
        NSAssert(NO, @"最小宽度不能大于最大宽度");
        return nil;
    }
    // 默认主题
    CGFloat defaultWidth      = 300.0f;
    UIFont  *defaultFont      = [UIFont systemFontOfSize:14.0f];
    UIColor *defaultTextColor = [UIColor blackColor];
    UIColor *defaultBgColor   = [UIColor whiteColor];
    CGFloat defaultLines      = 1;
    
    UIFont *aFont       = (nil == font ? defaultFont : font);
    UIColor *aColor     = (nil == textColor ? defaultTextColor : textColor);
    UIColor *aBackgroud = (nil == backgroudColor ? defaultBgColor : backgroudColor);
    CGFloat aLines      = (lines < 0 ? defaultLines : lines);

    CGRect aFrame = CGRectZero;
    CGFloat aMax = ceil( maxWidth > 0.0f ? maxWidth : defaultWidth);
    aFrame.size.width = aMax;
    aFrame.size.height = ceil(aFont.lineHeight);
    
    UILabel *label = [[[self class] alloc] initWithFrame:aFrame];
    label.font = aFont;
    label.textColor = aColor;
    label.backgroundColor = aBackgroud;
    label.textAlignment = alignment;
    label.numberOfLines = aLines;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    label.ff_width_scalable = maxWidth > minWidth;
    label.ff_min_width = ceil(minWidth);
    label.ff_max_width = ceil(maxWidth);
    
    return label;
}

#pragma mark - Instance
+ (instancetype)ff_labelWithTextColor:(UIColor *)color
                                 font:(UIFont *)font {
    return [self ff_labelWithTextColor:color
                                 font:font
                                alignment:NSTextAlignmentLeft];
}

+ (instancetype)ff_labelWithTextColor:(UIColor *)color
                                 font:(UIFont *)font
                            alignment:(NSTextAlignment)alignment {
    return [self ff_buildWithMinWidth:0.f
                             maxWidth:[UIScreen mainScreen].bounds.size.width
                                 font:font
                            textColor:color
                       backgroudColor:nil
                            alignment:alignment
                        numberOfLines:1];
}

+ (instancetype)ff_labelWithWidth:(CGFloat)width
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                   backgroudColor:(UIColor *)backgroudColor
                        alignment:(NSTextAlignment)alignment
                    numberOfLines:(NSInteger)lines{
    return [self ff_buildWithMinWidth:width
                             maxWidth:width
                                 font:font
                            textColor:textColor
                       backgroudColor:backgroudColor
                            alignment:alignment
                        numberOfLines:lines];
}

+ (instancetype)ff_labelWithMinWidth:(CGFloat)minWidth
                            maxWidth:(CGFloat)maxWidth
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                      backgroudColor:(UIColor *)backgroudColor
                           alignment:(NSTextAlignment)alignment
                       numberOfLines:(NSInteger)lines{
    return [self ff_buildWithMinWidth:minWidth
                             maxWidth:maxWidth
                                 font:font
                            textColor:textColor
                       backgroudColor:backgroudColor
                            alignment:alignment
                        numberOfLines:lines];
}

- (void)ff_sizeToFit {
    // 只有一行且宽度不可变则维持原frame
    if (self.numberOfLines == 1 && !self.ff_width_scalable) {
        return;
    }
    CGRect frame = self.frame;
    
    CGFloat minWidth = [self ff_min_width];
    CGFloat maxWidth = [self ff_max_width];
    
    CGSize attrSize = CGSizeZero;
    if (self.attributedText) { // 可变字体size计算
        attrSize = [self.attributedText ff_sizeWithMaxWidth:maxWidth];
    }
    
    // 不可变字体size计算
    CGSize textSize = CGSizeZero;
    NSString *text = self.text;
    if (!text) {
        text = @"";
    }
    textSize = [text ff_sizeWithFont:self.font maxWidth:maxWidth];

    // 计算后取最大的高度
    CGSize size = attrSize;
    if (textSize.height > size.height) {
        size = textSize;
    }
    
    if (self.ff_width_scalable) { // 宽度需要调整
        if (size.width < minWidth) {
            frame.size.width = minWidth;
        }
        else if (size.width > maxWidth){
            frame.size.width = maxWidth;
        }
        else {
            frame.size.width = size.width;
        }
    }
    
    switch (self.numberOfLines) {
            // 行数无限制，全部显示
        case 0:
            frame.size.height = size.height;
            break;
            // 显示固定行数
        default:{
            CGFloat lineHeight = ceil(self.font.lineHeight);
            frame.size.height = lineHeight*self.numberOfLines;
            break;
        }
    }
    self.frame = frame;
}

#pragma mark - getter & setter
- (BOOL)ff_width_scalable {
    return [[self associatedObjectForKey:@"ff_width_scalable"] boolValue];
}
- (void)setFf_width_scalable:(BOOL)ff_width_scalable {
    NSNumber *number = [NSNumber numberWithBool:ff_width_scalable];
    [self associateStrongNonatomicObject:number withKey:@"ff_width_scalable"];
}

- (CGFloat)ff_max_width {
    return [[self associatedObjectForKey:@"ff_max_width"] floatValue];
}
- (void)setFf_max_width:(CGFloat)ff_max_width {
    NSNumber *number = [NSNumber numberWithFloat:ff_max_width];
    [self associateStrongNonatomicObject:number withKey:@"ff_max_width"];
}

- (CGFloat)ff_min_width {
    return [[self associatedObjectForKey:@"ff_min_width"] floatValue];
}
- (void)setFf_min_width:(CGFloat)ff_min_width {
    NSNumber *number = [NSNumber numberWithFloat:ff_min_width];
    [self associateStrongNonatomicObject:number withKey:@"ff_min_width"];
}

@end
