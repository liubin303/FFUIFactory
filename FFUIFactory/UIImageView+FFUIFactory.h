//
//  UIImageView+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FFUIFactory)

/**
 *  生产一个高宽都为width的imageView
 *
 *  @param width 边框，默认值40
 *
 *  @return imageView
 *
 */
+ (instancetype)ff_imageViewWithWidth:(CGFloat)width;

/**
 *  生产一个大小为size的imageView
 *
 *  @param size 高宽，默认值CGSize(40,40)
 *
 *  @return imageView
 *
 */
+ (instancetype)ff_imageViewWithSize:(CGSize)size;

/**
 *  生产一个图片为image，size为image.size的imageView
 *
 *  @param image 设置的image，大小取image大小
 *
 *  @return imageView
 *
 */
+ (instancetype)ff_imageViewWithImage:(UIImage *)image;

/**
 *  生产一个一像素高度的线，内部根据当前分辨率扩充其透明线
 *
 *  @param width        边框，默认值40
 *  @param color        线的颜色，不能为空
 *  @param orientation  线的方向
 *
 *  @return 一个线的view
 *
 */
+ (instancetype)ff_lineWithWidth:(CGFloat)width color:(UIColor *)color orientation:(UIInterfaceOrientation)orientation;

@end
