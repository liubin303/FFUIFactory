//
//  NSMutableAttributedString+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/25.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (FFUIFactory)

/*!
 *  @brief 生成一个NSMutableAttributedString
 *
 *  @param string  字符内容
 *  @param font    字体
 *  @param color   颜色
 *
 *  @return NSMutableAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color;

/*!
 *  @brief 生成一个NSMutableAttributedString
 *
 *  @param string  字符内容
 *  @param font    字体
 *  @param color   颜色
 *  @param bgColor 背景颜色
 *
 *  @return NSMutableAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                      bgColor:(UIColor *)bgColor;

/*!
 *  @brief 生成一个NSMutableAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *
 *  @return NSMutableAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing;

/*!
 *  @brief 生成一个NSMutableAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *  @param underline   是否有下划线
 *
 *  @return NSMutableAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing
                                    underline:(BOOL)underline;

/*!
 *  @brief 生成一个NSAttributedString
 *
 *  @param string        字符内容
 *  @param font          字体
 *  @param color         颜色
 *  @param lineSpacing   行距，输入0时忽略
 *  @param strikethrough 是否有删除线
 *
 *  @return NSMutableAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing
                                strikethrough:(BOOL)strikethrough;

/*!
 *  @brief 追加一个NSAttributedString
 *
 *  @param string 字符内容
 *  @param font   字体
 *  @param color  颜色
 *
 *  @return NSMutableAttributedString
 *
 */
- (NSMutableAttributedString *)ff_appendString:(NSString *)string
                                          font:(UIFont *)font
                                         color:(UIColor *)color;

/*!
 *  @brief 追加一个NSAttributedString
 *
 *  @param string 字符内容
 *  @param font   字体
 *  @param color  颜色
 *  @param bgColor 背景颜色
 *
 *  @return NSMutableAttributedString
 *
 */
- (NSMutableAttributedString *)ff_appendString:(NSString *)string
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                       bgColor:(UIColor *)bgColor;

/*!
 *  @brief 追加一个NSAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *
 *  @return NSMutableAttributedString
 *
 */
- (NSMutableAttributedString *)ff_appendString:(NSString *)string
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                   lineSpacing:(CGFloat)lineSpacing;

/*!
 *  @brief 追加一个NSAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *  @param underline   是否有下划线
 *
 *  @return NSMutableAttributedString
 *
 */
- (NSMutableAttributedString *)ff_appendString:(NSString *)string
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                   lineSpacing:(CGFloat)lineSpacing
                                     underline:(BOOL)underline;

/*!
 *  @brief 追加一个NSAttributedString
 *
 *  @param string        字符内容
 *  @param font          字体
 *  @param color         颜色
 *  @param lineSpacing   行距，输入0时忽略
 *  @param strikethrough 是否有删除线
 *
 *  @return NSMutableAttributedString
 *
 */
- (NSMutableAttributedString *)ff_appendString:(NSString *)string
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                   lineSpacing:(CGFloat)lineSpacing
                                 strikethrough:(BOOL)strikethrough;

@end
