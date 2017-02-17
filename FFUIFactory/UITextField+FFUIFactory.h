//
//  UITextField+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/20.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (FFUIFactory)

/*!
 *  @brief 生产一个普通的输入框
 *
 *  @param size        尺寸，默认CGSize(180,40)
 *  @param font        字体大小，默认值为14
 *  @param color       字体颜色，默认值为黑色
 *  @param placeholder 提示字符
 *
 *  @return UITextField
 */
+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder;

/*!
 *  @brief 生产一个普通的输入框
 *
 *  @param size        尺寸，默认CGSize(180,40)
 *  @param font        字体大小，默认值为14
 *  @param color       字体颜色，默认值为黑色
 *  @param placeholder 提示字符
 *  @param adjustFont  文本是否自适应宽度,默认值NO
 *  @param minFont     自动缩小显示的最小字体大小,默认值11
 *
 *  @return UITextField
 */
+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder
                      adjustFont:(BOOL)adjustFont
                         minFont:(CGFloat)minFont;

/*!
 *  @brief 生产一个限制长度或字符的输入框
 *
 *  @param size            尺寸，默认CGSize(180,40)
 *  @param font            字体大小，默认值为14
 *  @param color           字体颜色，默认值为黑色
 *  @param placeholder     提示字符
 *  @param adjustFont      文本是否自适应宽度,默认值NO
 *  @param minFont         自动缩小显示的最小字体大小,默认值11
 *  @param maxLength       最大长度
 *  @param characterLimit  字符限制，只接受输入字符集中的字符
 *
 *  @return UITextField
 */
+ (instancetype)ff_inputWithSize:(CGSize)size
                            font:(UIFont *)font
                           color:(UIColor *)color
                     placeholder:(NSString *)placeholder
                      adjustFont:(BOOL)adjustFont
                         minFont:(CGFloat)minFont
                       maxLength:(NSUInteger)maxLength
                  characterLimit:(NSCharacterSet *)characterLimit;

/*!
 *  @brief 输入的最大长度，会忽略空格
 */
@property (nonatomic, assign, setter=setFFMaxLength:) NSUInteger ff_maxLength;

/*!
 *  @brief 字符限制，只接受输入字符集中的字符
 */
@property (nonatomic, copy, setter=setFFCharacterLimit:) NSCharacterSet *ff_characterLimit;

/*!
 *  @brief 输入格式限定，如344分隔，335分隔
 */
@property (nonatomic, copy, setter=setFFFormat:) NSString *(^ff_format)(NSString *originText);

/*!
 *  @brief 左边内间距
 */
@property (nonatomic, assign, setter=setFFLeftPadding:) CGFloat ff_leftPadding;

/*!
 *  @brief 右边内间距
 */
@property (nonatomic, assign, setter=setFFRightPadding:) CGFloat ff_rightPadding;

@end
