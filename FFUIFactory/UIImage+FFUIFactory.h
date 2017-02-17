//
//  UIImage+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FFUIFactory)

#pragma mark - Instance

/**
 *  @brief 从[NSBundle mainBundle]获取指定名称的png图片
 *
 *  @param fileName 图片名称
 *
 */
+ (UIImage *)ff_imageWithContentFileName:(NSString *)fileName;

/**
 *  @brief 从[NSBundle mainBundle]获取指定名称指定类型的图片
 *
 *  @param fileName  图片名称
 *  @param ext       扩展名
 *
 */
+ (UIImage *)ff_imageWithContentFileName:(NSString *)fileName ofType:(NSString *)ext;

/**
 *  @brief 返回一个指定颜色，size(1,1)的图片
 *
 *  @param color 一个颜色指标【不能为nil】
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithColor:(UIColor *)color;


/**
 *  @brief 返回一个指定颜色和size的图片
 *
 *  @param color 一个颜色指标【不能为nil】
 *  @param size  尺寸
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  @brief 返回一个size(radius+3,radius+3)的color颜色图片，
 *
 *  @param color  填充色颜色
 *  @param radius 圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithColor:(UIColor *)color cornerRadius:(CGFloat)radius;

/**
 *  @brief 返回一个size(radius+width+3,radius+width+3)的color颜色带with宽边线和borderColor颜色的图片
 *
 *  @param color       填充色颜色
 *  @param width       边线宽度
 *  @param borderColor 边线颜色
 *  @param radius      圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithColor:(UIColor *)color border:(CGFloat)width color:(UIColor *)borderColor cornerRadius:(CGFloat)radius;

/**
 *  @brief 返回一个size为给定size的渐变颜色从from到to的图片
 *
 *  @param size   size大小
 *  @param from   起始颜色，位置在top
 *  @param to     终止颜色，位置在bottom
 *  @param radius 圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to cornerRadius:(CGFloat)radius;

/**
 *  @brief 返回一个size为给定size的渐变颜色从from到to的带with宽边线和borderColor颜色的图片
 *
 *  @param size        size大小
 *  @param from        起始颜色，位置在top
 *  @param to          终止颜色，位置在bottom
 *  @param width       边线宽度
 *  @param borderColor 边线颜色
 *  @param radius      圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to border:(CGFloat)width color:(UIColor *)borderColor cornerRadius:(CGFloat)radius;

/**
 *  @brief 返回一个size为给定size的渐变颜色从from到to的带with宽边线和borderColor颜色的图片
 *
 *  @param size        size大小
 *  @param from        起始颜色，位置在top
 *  @param to          终止颜色，位置在bottom
 *  @param width       边线宽度
 *  @param borderColor 边线颜色
 *  @param blendingWidth 边缘配色宽度，使得绘制出的图片渐变更自然
 *  @param blendingColor 边缘配色，使得绘制出的图片渐变更自然
 *  @param radius      圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to border:(CGFloat)width color:(UIColor *)borderColor blending:(CGFloat)blendingWidth color:(UIColor *)blendingColor cornerRadius:(CGFloat)radius;

/**
 *  @brief 返回一个size为给定size的渐变颜色带with宽边线和borderColor颜色的图片
 *
 *  @param size         size大小
 *  @param colors       渐变颜色序列，元素为UIColor
 *  @param locations    渐变位置数组元素为CGFloat，取值[0~1]
 *  @param width         边框宽度
 *  @param borderColor   变宽颜色
 *  @param blendingWidth 配色宽度
 *  @param blendingColor 配色颜色
 *  @param radius        圆角半径
 *
 *  @return 图片
 *
 */
+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColors:(NSArray *)colors gradientLocations:(const CGFloat [])locations border:(CGFloat)width color:(UIColor *)borderColor blending:(CGFloat)blendingWidth color:(UIColor *)blendingColor cornerRadius:(CGFloat)radius;


/**
 *  @brief 返回一像素线图片，实际是1x2或者1x3的图片，根据屏幕scale决定
 *
 *  @param color       线的颜色
 *  @param orientation 透明像素填充方向
 *
 *  @return 一像素线图片
 *
 */
+ (UIImage *)ff_lineWithColor:(UIColor *)color orientation:(UIInterfaceOrientation)orientation;


/**
 *  @brief 绘制一个圆形线圈,线圈转角不是很好看
 *
 *  @param diameter    直径
 *  @param width       线宽
 *  @param borderColor 线颜色
 *
 *  @return 绘制一个圆形线圈
 *
 */
+ (UIImage *)ff_circleLineWithDiameter:(CGFloat)diameter border:(CGFloat)width color:(UIColor *)borderColor;

/**
 *  @brief 绘制一个圆形线圈
 *
 *  @param diameter    直径
 *  @param width       线宽
 *  @param borderColor 线颜色
 *  @param backgroudColor 背景色
 *
 *  @return 绘制一个圆形线圈
 *
 */
+ (UIImage *)ff_circleLineWithDiameter:(CGFloat)diameter border:(CGFloat)width color:(UIColor *)borderColor backgroudColor:(UIColor *)backgroudColor;

/**
 *  @brief 绘制一个圆
 *
 *  @param diameter 直径
 *  @param color    颜色
 *
 *  @return 绘制一个圆
 *
 */
+ (UIImage *)ff_circleWithDiameter:(CGFloat)diameter color:(UIColor *)color;

#pragma mark - Modify
/**
 * @brief 中间拉伸图
 *
 *  @return 中间拉伸图
 *
 */
- (UIImage *)ff_centerStretchImage;

/**
 *  @brief 绘制毛玻璃
 *
 *  @return 绘制毛玻璃
 *
 */
- (UIImage *)ff_gaussiafflurImage;

/**
 *  @brief 绘制毛玻璃
 *
 *  @param complete 绘制完
 *
 */
- (void)ff_gaussiafflurImageComplete:(void(^)(UIImage *image))complete;

/**
 *  @brief 绘制毛玻璃
 *
 *  @param radius     渲染半径
 *  @param iterations 重复渲染次数
 *
 *  @return 渲染后图片
 *
 */
- (UIImage *)ff_gaussiafflurImageWithRadius:(NSUInteger)radius iterations:(NSUInteger)iterations;

/**
 *  @brief 绘制毛玻璃
 *
 *  @param radius     渲染半径
 *  @param iterations 重复渲染次数
 *  @param complete   渲染完成回调
 *
 */
- (void)ff_gaussiafflurImageWithRadius:(NSUInteger)radius iterations:(NSUInteger)iterations complete:(void(^)(UIImage *image))complete;

/**
 *  @brief 绘制倒影图片
 *
 *  @return 倒影
 *
 */
- (UIImage *)ff_mirroredImage;

/**
 *  @brief 翻转图片
 *
 *  @param imageOrientation 翻转方向
 *
 *  @return 翻转后图片
 *
 */
- (UIImage *)ff_rotateWithimageOrientation:(UIImageOrientation)imageOrientation;

/**
 *  @brief 按指定角度旋转图片
 *
 *  @param degrees 角度
 *
 *  @return 旋转后的图片
 *
 */
- (UIImage*)ff_rotatedByDegrees:(CGFloat)degrees;

/**
 *  @brief 按指定尺寸缩放图片,会按屏幕分辨率再缩放
 *
 *  @param size 尺寸
 *
 *  @return 缩放后的图片
 *
 */
- (UIImage *)ff_scaleToSize:(CGSize)size;

/**
 *  @brief 按指定尺寸缩放图片，忽略屏幕分辨率
 *
 *  @param size 尺寸
 *
 *  @return 缩放后的图片
 *
 */
- (UIImage *)ff_scaleToSizeIgnoreScreenScale:(CGSize)size;

/**
 *  @brief 按指定颜色填充图片
 *
 *  @param color 颜色
 *
 *  @return 填充后的图片
 *
 */
- (UIImage *)ff_fillImageWithColor:(UIColor *)color;

@end
