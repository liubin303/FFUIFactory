//
//  NSAttributedString+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/25.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (FFUIFactory)

/*!
 *  @brief 返回字体所占用得尺寸
 *
 *  @param maxWidth  最大宽度,默认为屏幕宽度
 *
 *  @return 返回合适的尺寸,如果是一行会忽略行间距
 *
 */
- (CGSize)ff_sizeWithMaxWidth:(CGFloat)maxWidth;

/*!
 *  @brief 生成一个NSAttributedString
 *
 *  @param string  字符内容
 *  @param font    字体
 *  @param color   颜色
 *
 *  @return NSAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color;

/*!
 *  @brief 生成一个NSAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *
 *  @return NSAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing;

/*!
 *  @brief 生成一个NSAttributedString
 *
 *  @param string      字符内容
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行距，输入0时忽略
 *  @param underline   是否有下划线
 *
 *  @return NSAttributedString
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
 *  @return NSAttributedString
 *
 */
+ (instancetype)ff_attributedStringWithString:(NSString *)string
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                  lineSpacing:(CGFloat)lineSpacing
                                strikethrough:(BOOL)strikethrough;

@end
