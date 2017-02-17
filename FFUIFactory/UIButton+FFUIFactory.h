//
//  UIButton+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (FFUIFactory)

/*!
 *  @brief 生产一个固定大小的button，背景支持颜色，圆角
 *
 *  @param size              大小，默认值CGSize(60,40)
 *  @param radius            圆角半径
 *  @param font              字体大小，默认值为14
 *  @param normalColor       字体颜色，默认值为黑色
 *  @param selectedColor     字体选中颜色（兼高亮），默认nil
 *  @param disabledColor     不可用颜色，默认nil
 *  @param normalBgColor     背景色，默认纯白
 *  @param selectedBgColor   选中背景色，默认nil
 *  @param disabledBgColor   不可用背景色，默认nil
 *
 *  @return UIButton
 *
 */
+ (instancetype)ff_buttonWithSize:(CGSize)size
                     cornerRadius:(CGFloat)radius
                             font:(UIFont *)font
                      normalColor:(UIColor *)normalColor
                    selectedColor:(UIColor *)selectedColor
                    disabledColor:(UIColor *)disabledColor
                    normalBgColor:(UIColor *)normalBgColor
                  selectedBgColor:(UIColor *)selectedBgColor
                  disabledBgColor:(UIColor *)disabledBgColor;

/*!
*  @brief 生产一个固定大小的button，背景支持图片
*
*  @param size              大小，默认值CGSize(60,40)
*  @param font              字体大小，默认值为14
*  @param normalColor       字体颜色，默认值为黑色
*  @param selectedColor     字体选中颜色（兼高亮），默认nil
*  @param disabledColor     不可用颜色，默认nil
*  @param normalBgImage     背景图，默认纯白
*  @param selectedBgImage   选中背景图，默认nil
*  @param disabledBgImage   不可用背景图，默认nil
*
*  @return UIButton
*
*  @since 4.10.0
*/
+ (instancetype)ff_buttonWithSize:(CGSize)size
                             font:(UIFont *)font
                      normalColor:(UIColor *)normalColor
                    selectedColor:(UIColor *)selectedColor
                    disabledColor:(UIColor *)disabledColor
                    normalBgImage:(UIImage *)normalBgImage
                  selectedBgImage:(UIImage *)selectedBgImage
                  disabledBgImage:(UIImage *)disabledBgImage;

/*!
 *  @brief 生产一个可变大小的button，背景支持颜色，圆角
 *
 *  @param minWidth          最小宽度，默认值为0
 *  @param maxWidth          最大宽度，默认值为300
 *  @param radius            圆角半径
 *  @param edge              内间距，默认值为10
 *  @param height            高度，默认值为40
 *  @param font              字体大小，默认值为14
 *  @param normalColor       字体颜色，默认值为黑色
 *  @param selectedColor     字体选中颜色（兼高亮），默认nil
 *  @param disabledColor     不可用颜色，默认nil
 *  @param normalBgColor     背景色，默认纯白
 *  @param selectedBgColor   选中背景色，默认nil
 *  @param disabledBgColor   不可用背景色，默认nil
 *
 *  @return UIButton
 *
 */
+ (instancetype)ff_buttonWithMinWidth:(CGFloat)minWidth
                             maxWidth:(CGFloat)maxWidth
                         cornerRadius:(CGFloat)radius
                                 edge:(CGFloat)edge
                               height:(CGFloat)height
                                 font:(UIFont *)font
                          normalColor:(UIColor *)normalColor
                        selectedColor:(UIColor *)selectedColor
                        disabledColor:(UIColor *)disabledColor
                        normalBgColor:(UIColor *)normalBgColor
                      selectedBgColor:(UIColor *)selectedBgColor
                      disabledBgColor:(UIColor *)disabledBgColor;

/*!
 *  @brief 生产一个可变大小的button，背景支持图片
 *
 *  @param minWidth          最小宽度，默认值为0
 *  @param maxWidth          最大宽度，默认值为300
 *  @param edge              内间距，默认值为10
 *  @param height            高度，默认值为40
 *  @param font              字体大小，默认值为14
 *  @param normalColor       字体颜色，默认值为黑色
 *  @param selectedColor     字体选中颜色（兼高亮），默认nil
 *  @param disabledColor     不可用颜色，默认nil
 *  @param normalBgImage     背景图，默认纯白
 *  @param selectedBgImage   选中背景图，默认nil
 *  @param disabledBgImage   不可用背景图，默认nil
 *
 *  @return UIButton
 *
 */
+ (instancetype)ff_buttonWithMinWidth:(CGFloat)minWidth
                             maxWidth:(CGFloat)maxWidth
                                 edge:(CGFloat)edge
                               height:(CGFloat)height
                                 font:(UIFont *)font
                          normalColor:(UIColor *)normalColor
                        selectedColor:(UIColor *)selectedColor
                        disabledColor:(UIColor *)disabledColor
                        normalBgImage:(UIImage *)normalBgImage
                      selectedBgImage:(UIImage *)selectedBgImage
                      disabledBgImage:(UIImage *)disabledBgImage;

/*!
 *  @brief 尺寸自适应
 */
- (void)ff_sizeToFit;

/*!
 *  @brief 添加点击事件
 *
 *  @param target   target
 *  @param selector action
 *
 */
- (void)ff_addTarget:(id)target touchAction:(SEL)selector;

#pragma mark - property
/*!
 *  @brief normal状态下的标题文字
 */
@property (nonatomic, copy, setter=setFFNormalTitle:) NSString     *ff_normalTitle;
/*!
 *  @brief normal状态下的标题颜色
 */
@property (nonatomic, strong, setter=setFFNormalTitleColor:) UIColor      *ff_normalTitleColor;
/*!
 *  @brief normal状态下的图片
 */
@property (nonatomic, strong, setter=setFFNormalImage:) UIImage      *ff_normalImage;
/*!
 *  @brief normal状态下的背景图片
 */
@property (nonatomic, strong, setter=setFFNormalBackgroundImage:) UIImage      *ff_normalBackgroundImage;

/*!
 *  @brief highlighted/selected状态下的标题文字
 */
@property (nonatomic, copy, setter=setFFSelectedTitle:) NSString     *ff_selectedTitle;
/*!
 *  @brief highlighted/selected状态下的标题文字
 */
@property (nonatomic, strong, setter=setFFSelectedTitleColor:) UIColor      *ff_selectedTitleColor;
/*!
 *  @brief highlighted/selected状态下的图片
 */
@property (nonatomic, strong, setter=setFFSelectedImage:) UIImage      *ff_selectedImage;
/*!
 *  @brief highlighted/selected状态下的背景图片
 */
@property (nonatomic, strong, setter=setFFSelectedBackgroundImage:) UIImage      *ff_selectedBackgroundImage;

/*!
 *  @brief disabled状态下的标题文字
 */
@property (nonatomic, copy, setter=setFFDisabledTitle:) NSString     *ff_disabledTitle;
/*!
 *  @brief disabled状态下的标题文字
 */
@property (nonatomic, strong, setter=setFFDisabledTitleColor:) UIColor      *ff_disabledTitleColor;
/*!
 *  @brief disabled状态下的图片
 */
@property (nonatomic, strong, setter=setFFDisabledImage:) UIImage      *ff_disabledImage;
/*!
 *  @brief disabled状态下的背景图片
 */
@property (nonatomic, strong, setter=setFFDisabledBackgroundImage:) UIImage      *ff_disabledBackgroundImage;

/*!
 *  @brief 扩大按钮的点击范围（outsets表示自己frame向外延生部分，superview要足够大）
 */
@property (nonatomic, assign, setter=setFFHitEdgeOutsets:) UIEdgeInsets ff_hitEdgeOutsets;

/*!
 *  @brief size是否可以自动缩放(只在max~min之间变化)
 */
@property (nonatomic, assign, readonly) BOOL                  ff_width_scalable;
/*!
 *  @brief 最大宽度
 */
@property (nonatomic, assign, readonly) CGFloat               ff_max_width;
/*!
 *  @brief 最小宽度
 */
@property (nonatomic, assign, readonly) CGFloat               ff_min_width;
/*!
 *  @brief title的内间距
 */
@property (nonatomic, assign, readonly) CGFloat               ff_edge_width;

@end
