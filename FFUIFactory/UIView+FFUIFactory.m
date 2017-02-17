//
//  UIView+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIView+FFUIFactory.h"

@implementation UIView (FFUIFactory)

#pragma mark - Instance
+ (instancetype)ff_view {
    return [[UIView alloc] init];
}

+ (instancetype)ff_viewWithFrame:(CGRect)frame {
    return [[UIView alloc] initWithFrame:frame];
}

+ (instancetype)ff_viewWithColor:(UIColor *)color {
    UIView *view = [UIView ff_view];
    view.backgroundColor = color;
    return view;
}

+ (instancetype)ff_viewWithColor:(UIColor *)color frame:(CGRect)frame {
    UIView *view = [UIView ff_viewWithColor:color];
    view.frame = frame;
    return view;
}

+ (instancetype)ff_lineWithWidth:(CGFloat)width color:(UIColor *)color {
    UIView *view = [UIView ff_viewWithColor:color frame:CGRectMake(0, 0, width, 1*[UIScreen mainScreen].scale)];
    return view;
}

+ (instancetype)ff_lineWithHeight:(CGFloat)height color:(UIColor *)color {
    UIView *view = [UIView ff_viewWithColor:color frame:CGRectMake(0, 0, 1*[UIScreen mainScreen].scale, height)];
    return view;
}

#pragma mark - UIGestureRecognizer
- (UITapGestureRecognizer *)ff_addTapGestureWithTarget:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    return tap;
}

- (UIPanGestureRecognizer *)ff_addPanGestureWithTarget:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:pan];
    return pan;
}

- (UISwipeGestureRecognizer *)ff_addSwipeGestureWithTarget:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:swipe];
    return swipe;
}

#pragma mark - Animation
- (void)ff_fadeShowAnimation {
    [self ff_fadeShowAnimationComplete:nil];
}

- (void)ff_fadeShowAnimationComplete:(void(^)(void))complete {
    [self ff_fadeShowAnimationDuration:0.3f complete:complete];
}

- (void)ff_fadeShowAnimationDuration:(NSTimeInterval)duration complete:(void (^)(void))complete {
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished){
        if (complete) complete();
    }];
}

- (void)ff_fadeHideAnimation {
    [self ff_fadeHideAnimationComplete:nil];
}

- (void)ff_fadeHideAnimationComplete:(void(^)(void))complete {
    [self ff_fadeHideAnimationDuration:0.3f complete:complete];
}

- (void)ff_fadeHideAnimationDuration:(NSTimeInterval)duration complete:(void (^)(void))complete {
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished){
        self.hidden = YES;
        self.alpha = 1;
        if (complete) complete();
    }];
}

- (void)ff_removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

#pragma mark - getter & setter
- (CGSize)ff_size {
    return self.frame.size;
}
- (void)setFFSize:(CGSize)ff_size{
    CGRect frame = self.frame;
    frame.size = ff_size;
    self.frame = frame;
}

- (CGPoint)ff_origin {
    return self.frame.origin;
}
- (void)setFFOrigin:(CGPoint)ff_origin {
    CGRect frame = self.frame;
    frame.origin = ff_origin;
    self.frame = frame;
}

- (CGFloat)ff_height {
    return self.frame.size.height;
}
- (void)setFFHeight:(CGFloat)ff_height {
    CGRect frame = self.frame;
    frame.size.height = ff_height;
    self.frame = frame;
}

- (CGFloat)ff_width {
    return self.frame.size.width;
}
- (void)setFFWidth:(CGFloat)ff_width {
    CGRect frame = self.frame;
    frame.size.width = ff_width;
    self.frame = frame;
}

- (CGFloat)ff_x {
    return self.frame.origin.x;
}
- (void)setFFX:(CGFloat)ff_x {
    CGRect frame = self.frame;
    frame.origin.x = ff_x;
    self.frame = frame;
}

- (CGFloat)ff_y {
    return self.frame.origin.y;
}
- (void)setFFY:(CGFloat)ff_y {
    CGRect frame = self.frame;
    frame.origin.y = ff_y;
    self.frame = frame;
}

- (CGFloat)ff_left {
    return self.frame.origin.x;
}
- (void)setFFLeft:(CGFloat)ff_left {
    CGRect frame = self.frame;
    frame.origin.x = ff_left;
    self.frame = frame;
}

- (CGFloat)ff_right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setFFRight:(CGFloat)ff_right {
    CGRect frame = self.frame;
    frame.origin.x = ff_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ff_top {
    return self.frame.origin.y;
}
- (void)setFFTop:(CGFloat)ff_top {
    CGRect frame = self.frame;
    frame.origin.y = ff_top;
    self.frame = frame;
}

- (CGFloat)ff_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setFFBottom:(CGFloat)ff_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ff_bottom - frame.size.height;
    self.frame = frame;
}

- (CGPoint)ff_center {
    return self.center;
}
- (void)setFFCenter:(CGPoint)ff_center {
    self.center = ff_center;
}

- (CGFloat)ff_centerX {
    return self.center.x;
}
- (void)setFFCenterX:(CGFloat)ff_centerX {
    CGPoint center = self.center;
    center.x = ff_centerX;
    self.center = center;
}

- (CGFloat)ff_centerY {
    return self.center.y;
}
- (void)setFFCenterY:(CGFloat)ff_centerY {
    CGPoint center = self.center;
    center.y = ff_centerY;
    self.center = center;
}

- (CGPoint)ff_topLeft {
    return self.frame.origin;
}
- (void)setFFTopLeft:(CGPoint)ff_topLeft {
    CGRect frame = self.frame;
    frame.origin = ff_topLeft;
    self.frame = frame;
}

- (CGPoint)ff_topRight {
    CGRect frame = self.frame;
    frame.origin.x += frame.size.width;
    return frame.origin;
}
- (void)setFFTopRight:(CGPoint)ff_topRight {
    CGRect frame = self.frame;
    frame.origin.x = ff_topRight.x - frame.size.width;
    frame.origin.y = ff_topRight.y;
    self.frame = frame;
}

- (CGPoint)ff_bottomLeft {
    CGRect frame = self.frame;
    frame.origin.y += frame.size.height;
    return frame.origin;
}
- (void)setFFBottomLeft:(CGPoint)ff_bottomLeft {
    CGRect frame = self.frame;
    frame.origin.x = ff_bottomLeft.x;
    frame.origin.y = ff_bottomLeft.y - frame.size.height;
    self.frame = frame;
}

- (CGPoint)ff_bottomRight {
    CGRect frame = self.frame;
    frame.origin.x += frame.size.width;
    frame.origin.y += frame.size.height;
    return frame.origin;
}
- (void)setFFBottomRight:(CGPoint)ff_bottomRight {
    CGRect frame = self.frame;
    frame.origin.x = ff_bottomRight.x - frame.size.width;
    frame.origin.y = ff_bottomRight.y - frame.size.height;
    self.frame = frame;
}

- (UIImage *)ff_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        //由于iOS 8.1-8.4 有可能出线 self.bounds.size.width为0导致崩溃的情况 故在此增加此判断
        if (self.bounds.size.width == 0) {
            return nil;
        }
        BOOL success = [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
        if (!success) {
            //            NSLog(@"drawViewHierarchyInRect failed");
        }
    }
    else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIViewController *)ff_viewController {
    for (UIView *view = self.superview; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIView *)ff_firstResponder
{
    // Search recursively for first responder
    for (UIView *childView in self.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] ) {
           return childView;
        }
        UIView *result = [childView ff_firstResponder];
        if ( result ) {
            return result;
        }
    }
    return nil;
}


@end
