//
//  UILabel+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FFUIFactory)

/*!
*  @brief 生成一个宽度为屏幕宽度，背景色白色，左对齐，行数1的label
*
*  @param color 文字颜色，默认值黑色
*  @param font  字体，默认14
*
*  @return UILabel
*/
+ (instancetype)ff_labelWithTextColor:(UIColor *)color
                                 font:(UIFont *)font;

/*!
 *  @brief 生成一个宽度为屏幕宽度，背景色白色，行数1的label
 *
 *  @param color     文字颜色，默认值黑色
 *  @param font      字体，默认14
 *  @param alignment 对齐方式
 *
 *  @return UILabel
 */
+ (instancetype)ff_labelWithTextColor:(UIColor *)color
                                 font:(UIFont *)font
                            alignment:(NSTextAlignment)alignment;

/*!
*  @brief 生产一个宽度为width的label
*
*  @param width          宽度，默认值300
*  @param font           字体，默认值14
*  @param textColor      文字颜色，默认值黑色
*  @param backgroudColor 背景色，默认值白色
*  @param alignment      对齐方式
*  @param lines          行数，默认1
*
*  @return UILabel
*
*/
+ (instancetype)ff_labelWithWidth:(CGFloat)width
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                   backgroudColor:(UIColor *)backgroudColor
                        alignment:(NSTextAlignment)alignment
                    numberOfLines:(NSInteger)lines;

/*!
 *  @brief 生产一个可变宽度的label
 *
 *  @param minWidth       最小宽度，默认值0
 *  @param maxWidth       最大宽度，默认值300
 *  @param font           字体，默认值14
 *  @param textColor      文字颜色，默认值黑色
 *  @param backgroudColor 背景色，默认值白色
 *  @param alignment      对齐方式
 *  @param lines          行数，默认1
 *
 *  @return UILabel
 *
 */
+ (instancetype)ff_labelWithMinWidth:(CGFloat)minWidth
                            maxWidth:(CGFloat)maxWidth
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                      backgroudColor:(UIColor *)backgroudColor
                           alignment:(NSTextAlignment)alignment
                       numberOfLines:(NSInteger)lines;

/*!
 *  @brief 尺寸自适应
 */
- (void)ff_sizeToFit;

/*!
 *  @brief 宽度是否可以自动缩放(只在min~max之间变化)
 */
@property (nonatomic, assign, readonly) BOOL    ff_width_scalable;
/*!
 *  @brief 最大宽度
 */
@property (nonatomic, assign, readonly) CGFloat ff_max_width;
/*!
 *  @brief 最小宽度
 */
@property (nonatomic, assign, readonly) CGFloat ff_min_width;

@end
