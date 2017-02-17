//
//  UITextField+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/20.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UITextField+FFUIFactory.h"
#import "NSObject+AssociatedObjects.h"
#import "NSString+FFUIFactory.h"

@implementation UITextField (FFUIFactory)

#pragma mark - private
- (void)ff_input_did_change_action:(id)sender {
    @autoreleasepool {
        //解决ios7中文键盘崩溃问题
        if (self.markedTextRange != nil) {
            return;
        }

        if (self.text.length <= 0) {
            return ;
        }
        
        // 先清掉空格
        NSString *resultText = [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        // 字符长度限制
        NSUInteger max_length = self.ff_maxLength;
        if (max_length > 0 && resultText.length > max_length) {
            resultText = [resultText substringToIndex:max_length];
        }
        
        // 判断非法字符
        NSCharacterSet *set = self.ff_characterLimit;
        if (set) {//非法字符判断
            NSString *result = [resultText stringByTrimmingCharactersInSet:set];
            
            if ([result length]) {//需要过滤
                resultText = [resultText ff_substringMeetCharacterSet:set];
            }
        }

        // 格式限定
        NSString *(^ff_format)(NSString *originText) = self.ff_format;
        if (ff_format) {
            NSString *atext = ff_format(resultText);
            if ([atext length]) {
                resultText = atext;
            }
        }
        
        //最后结果
        if (resultText != self.text && ![resultText isEqualToString:self.text]) {
            self.text = resultText;
        }
    }
}

+ (instancetype)ff_buildWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder
                      adjustFont:(BOOL)adjustFont
                         minFont:(CGFloat)minFont
                       maxLength:(NSUInteger)maxLength
                  characterLimit:(NSCharacterSet *)characterLimit{
    // 默认主题
    CGFloat defaultWidth      = 180.0f;
    CGFloat defaultHeight     = 40.0f;
    UIFont  *defaultFont      = [UIFont systemFontOfSize:14.0f];
    CGFloat defaultMinFont    = 11.0f;
    UIColor *defaultTextColor = [UIColor blackColor];
    
    UIFont *aFont = (nil == font ? defaultFont : font);
    UIColor *aColor = (nil == color ? defaultTextColor : color);
    CGFloat aMinFont = (minFont < 0.0f ? defaultMinFont : minFont);
    
    CGRect frame = CGRectZero;
    frame.size.width = (size.width <= 0.0f ? defaultWidth : size.width);
    frame.size.height = (size.height <= 0.0f ? defaultHeight : size.height);

    UITextField *input              = [[[self class] alloc] initWithFrame:frame];
    input.font                      = aFont;
    input.textColor                 = aColor;
    input.placeholder               = placeholder;
    input.adjustsFontSizeToFitWidth = adjustFont;
    input.backgroundColor           = [UIColor clearColor];
    input.minimumFontSize           = aMinFont;
    input.clearButtonMode           = UITextFieldViewModeWhileEditing;
    
    if (maxLength > 0) {
        input.ff_maxLength = maxLength;
    }
    
    if (characterLimit) {
        input.ff_characterLimit = characterLimit;
    }
    
    [input addTarget:input action:@selector(ff_input_did_change_action:) forControlEvents:UIControlEventEditingChanged];
    
    return input;
}

#pragma mark - Instance
+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder{
    return [self ff_buildWithSize:size
                             font:font
                            color:color
                      placeholder:placeholder
                       adjustFont:NO
                          minFont:0
                        maxLength:0
                   characterLimit:nil];
}

+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder
                      adjustFont:(BOOL)adjustFont
                         minFont:(CGFloat)minFont {
    return [self ff_buildWithSize:size
                             font:font
                            color:color
                      placeholder:placeholder
                       adjustFont:adjustFont
                          minFont:minFont
                        maxLength:0
                   characterLimit:nil];
}

+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder
                      adjustFont:(BOOL)adjustFont
                         minFont:(CGFloat)minFont
                       maxLength:(NSUInteger)maxLength
                  characterLimit:(NSCharacterSet *)characterLimit {
    return [self ff_buildWithSize:size
                             font:font
                            color:color
                      placeholder:placeholder
                       adjustFont:adjustFont
                          minFont:minFont
                        maxLength:maxLength
                   characterLimit:characterLimit];
}

#pragma mark - getter & setter
- (NSUInteger)ff_maxLength {
    return [[self associatedObjectForKey:@"ff_maxLength"] unsignedIntegerValue];
}
- (void)setFFMaxLength:(NSUInteger)ff_maxLength {
    if (ff_maxLength > 0 && [self.text length] > ff_maxLength) {
        self.text = [self.text substringToIndex:ff_maxLength];
    }
    [self associateStrongNonatomicObject:@(ff_maxLength) withKey:@"ff_maxLength"];
}

- (NSCharacterSet *)ff_characterLimit {
    return [self associatedObjectForKey:@"ff_characterLimit"];
}
- (void)setFFCharacterLimit:(NSCharacterSet *)ff_characterLimit {
    NSCharacterSet *set = self.ff_characterLimit;
    if ((set == nil && ff_characterLimit == nil) || [set isEqual:ff_characterLimit]) {
        return ;
    }
    if (ff_characterLimit && (!set || ![ff_characterLimit isSupersetOfSet:set])) {
        self.text = [self.text ff_substringMeetCharacterSet:ff_characterLimit];
    }
    [self associateStrongNonatomicObject:ff_characterLimit withKey:@"ff_characterLimit"];
}

- (NSString *(^)(NSString *originText))ff_format {
    return [self associatedObjectForKey:@"ff_format"];
}
- (void)setFFFormat:(NSString *(^)(NSString *))ff_format {
    if (ff_format) {
        @autoreleasepool {
            NSString *text = ff_format(self.text);
            if ([text length] && ![text isEqualToString:self.text]) {
                self.text = text;
            }
        }
    }
    [self associateStrongNonatomicObject:ff_format withKey:@"ff_format"];
}

- (CGFloat)ff_leftPadding {
    return [[self associatedObjectForKey:@"ff_leftPadding"] floatValue];
}
- (void)setFFLeftPadding:(CGFloat)ff_leftPadding {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ff_leftPadding, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    return [self associateStrongNonatomicObject:@(ff_leftPadding) withKey:@"ff_leftPadding"];
}

- (CGFloat)ff_rightPadding {
    return [[self associatedObjectForKey:@"ff_rightPadding"] floatValue];
}
- (void)setFFRightPadding:(CGFloat)ff_rightPadding {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ff_rightPadding, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
    [self associateStrongNonatomicObject:@(ff_rightPadding) withKey:@"ff_rightPadding"];
}


@end
