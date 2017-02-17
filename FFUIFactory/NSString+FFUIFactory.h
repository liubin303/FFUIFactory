//
//  NSString+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/25.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (FFUIFactory)

/*!
*  @brief 返回一个string显示font需要的尺寸
*
*  @param font     字体大小
*  @param maxWidth 最大宽度
*
*  @return 返回合适的尺寸
*
*/
- (CGSize)ff_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/*!
 *  @brief 返回一个过滤后的string
 *
 *  @param set 过滤条件
 *
 *  @return NSString
 *
 */
- (NSString *)ff_substringMeetCharacterSet:(NSCharacterSet *)set;
@end
