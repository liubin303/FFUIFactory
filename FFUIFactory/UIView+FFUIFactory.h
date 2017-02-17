//
//  UIView+FFUIFactory.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (FFUIFactory)

#pragma mark - Property
/*!
 *  @brief view大小，改变时不改变原点位置
 */
@property (nonatomic, assign, setter=setFFSize:) CGSize  ff_size;
/*!
 *  @brief 起始点坐标
 */
@property (nonatomic, assign, setter=setFFOrigin:) CGPoint ff_origin;
/*!
 *  @brief 宽
 */
@property (nonatomic, assign, setter=setFFWidth:) CGFloat ff_width;
/*!
 *  @brief 高
 */
@property (nonatomic, assign, setter=setFFHeight:) CGFloat ff_height;
/*!
 *  @brief 起始点x
 */
@property (nonatomic, assign, setter=setFFX:) CGFloat ff_x;
/*!
 *  @brief 起始点y
 */
@property (nonatomic, assign, setter=setFFY:) CGFloat ff_y;
/*!
 *  @brief 左边x
 */
@property (nonatomic, assign, setter=setFFLeft:) CGFloat ff_left;
/*!
 *  @brief 右边x
 */
@property (nonatomic, assign, setter=setFFRight:) CGFloat ff_right;
/*!
 *  @brief 顶部y
 */
@property (nonatomic, assign, setter=setFFTop:) CGFloat ff_top;
/*!
 *  @brief 底部y
 */
@property (nonatomic, assign, setter=setFFBottom:) CGFloat ff_bottom;
/*!
 *  @brief 中心点坐标
 */
@property (nonatomic, assign, setter=setFFCenter:) CGPoint ff_center;
/*!
 *  @brief 中心点X
 */
@property (nonatomic, assign, setter=setFFCenterX:) CGFloat ff_centerX;
/*!
 *  @brief 中心点Y
 */
@property (nonatomic, assign, setter=setFFCenterY:) CGFloat ff_centerY;
/*!
 *  @brief 左上角坐标
 */
@property (nonatomic, assign, setter=setFFTopLeft:) CGPoint ff_topLeft;
/*!
 *  @brief 右上角坐标
 */
@property (nonatomic, assign, setter=setFFTopRight:) CGPoint ff_topRight;
/*!
 *  @brief 右下角坐标
 */
@property (nonatomic, assign, setter=setFFBottomRight:) CGPoint ff_bottomRight;
/*!
 *  @brief 左下角坐标
 */
@property (nonatomic, assign, setter=setFFBottomLeft:) CGPoint ff_bottomLeft;
/*!
 *  @brief view快照
 */
@property (nonatomic, readonly) UIImage *ff_snapshotImage;
/*!
 *  @brief 所属的vc，可能为nil
 */
@property (nonatomic, readonly) UIViewController *ff_viewController;
/*!
 *  @brief view的第一响应对象
 */
@property (nonatomic, readonly) UIView *ff_firstResponder;

#pragma mark - Instance
/*!
 *  @brief 生产一个view
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_view;

/*!
 *  @brief 生产一个指定frame的view
 *
 *  @param frame frame
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_viewWithFrame:(CGRect)frame;

/*!
 *  @brief 生产一个带背景色的view
 *
 *  @param color 背景色
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_viewWithColor:(UIColor *)color;

/*!
 *  @brief 生产一个带背景色指定frame的view
 *
 *  @param frame frame
 *
 *  @param color 背景色
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_viewWithColor:(UIColor *)color frame:(CGRect)frame;


/*!
 *  @brief 生产一个高度为height的1*屏幕scale宽的线
 *
 *  @param height 高度
 *  @param color  颜色
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_lineWithHeight:(CGFloat)height color:(UIColor *)color;

/*!
 *  @brief 生产一个宽度为width的1*屏幕scale高的线
 *
 *  @param width 宽度
 *  @param color 颜色
 *
 *  @return UIView
 *
 */
+ (instancetype)ff_lineWithWidth:(CGFloat)width color:(UIColor *)color;

#pragma mark - UIGestureRecognizer
/*!
 *  @brief 添加轻触手势
 *
 *  @param target 响应目标
 *  @param action 响应方法
 *
 *  @return 手势实例
 */
- (UITapGestureRecognizer *)ff_addTapGestureWithTarget:(id)target action:(SEL)action;

/*!
 *  @brief 添加拖动手势
 *
 *  @param target 响应目标
 *  @param action 响应方法
 *
 *  @return 手势实例
 */
- (UIPanGestureRecognizer *)ff_addPanGestureWithTarget:(id)target action:(SEL)action;

/*!
 *  @brief 添加快速滑动手势
 *
 *  @param target 响应目标
 *  @param action 响应方法
 *
 *  @return 手势实例
 */
- (UISwipeGestureRecognizer *)ff_addSwipeGestureWithTarget:(id)target action:(SEL)action;

#pragma mark - Animation
/*!
 *  @brief 添加渐入动画，默认0.3s
 */
- (void)ff_fadeShowAnimation;

/*!
 *  @brief 添加渐入动画，默认0.3s
 *
 *  @param complete 完成后的回调
 */
- (void)ff_fadeShowAnimationComplete:(void(^)(void))complete;

/*!
 *  @brief 添加渐入动画
 *
 *  @param duration 动画执行时间
 *  @param complete 完成后的回调
 */
- (void)ff_fadeShowAnimationDuration:(NSTimeInterval)duration complete:(void(^)(void))complete;

/*!
 *  @brief 添加渐出动画，默认0.3s
 */
- (void)ff_fadeHideAnimation;

/*!
 *  @brief 添加渐出动画，默认0.3s
 *
 *  @param complete 完成后的回调
 */
- (void)ff_fadeHideAnimationComplete:(void(^)(void))complete;

/*!
 *  @brief 添加渐出动画
 *
 *  @param duration 动画执行时间
 *  @param complete 完成后的回调
 */
- (void)ff_fadeHideAnimationDuration:(NSTimeInterval)duration complete:(void(^)(void))complete;

/*!
 *  @brief 移除所有子view
 */
- (void)ff_removeAllSubviews;

@end

