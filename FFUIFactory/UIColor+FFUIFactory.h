//
//  UIColor+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/12/20.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (FFUIFactory)

/*!
 *  @brief 根据16进制数生产一个透明度为1的颜色值
 *
 *  @param hexValue 一个十六进制数，如0xffffff
 *
 *  @return 颜色值
 */
+ (UIColor *)ff_colorWithHex:(NSInteger)hexValue;

/*!
 *  @brief 根据16进制数、透明度生产一个颜色值
 *
 *  @param hexValue   一个十六进制数，如0xffffff
 *  @param alphaValue 透明度，0~1
 *
 *  @return 颜色值
 */
+ (UIColor *)ff_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/*!
 *  @brief 根据16进制字符串生产一个颜色值，支持忽略#、0x、0X字符，若需要alpha，则在尾部加上1~255之间的数字，不传则透明度为1
 *
 *  @param hexString 一个十六进制字符串，如@"#ffffff"、@"0xffffff200"、@"ffffff200"
 *
 *  @return 颜色值
 */
+ (UIColor *)ff_colorWithHexString:(NSString *)hexString;

@end
