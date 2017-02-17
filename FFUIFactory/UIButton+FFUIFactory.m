//
//  UIButton+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIButton+FFUIFactory.h"
#import "NSObject+AssociatedObjects.h"
#import "UIImage+FFUIFactory.h"
#import "NSString+FFUIFactory.h"

@implementation UIButton (FFUIFactory)

#pragma mark - private
+ (instancetype)ff_buildWithMinWidth:(CGFloat)minWidth
                            maxWidth:(CGFloat)maxWidth
                                edge:(CGFloat)edge
                              height:(CGFloat)height
                                font:(UIFont *)font
                         normalColor:(UIColor *)normalColor
                       selectedColor:(UIColor *)selectedColor
                       disabledColor:(UIColor *)disabledColor
                       normalBgImage:(UIImage *)normalBgImage
                     selectedBgImage:(UIImage *)selectedBgImage
                     disabledBgImage:(UIImage *)disabledBgImage {
    if (minWidth < 0 || maxWidth < 0) {
        NSAssert(NO, @"宽度不能小于0");
        return nil;
    }
    
    if (minWidth > maxWidth) {
        NSAssert(NO, @"最小宽度不能大于最大宽度");
        return nil;
    }
    // 默认主题
    CGFloat defaultWidth      = 300.0f;
    CGFloat defaultHeight     = 40.0f;
    CGFloat defaultEdge       = 10.0f;
    UIFont  *defaultFont      = [UIFont systemFontOfSize:14.0f];
    UIColor *defaultTextColor = [UIColor blackColor];
    UIImage *defaultBgImage   = [UIImage ff_imageWithColor:[UIColor whiteColor]];
    
    UIFont *aFont       = (nil == font ? defaultFont : font);
    UIColor *aColor     = (nil == normalColor ? defaultTextColor : normalColor);
    UIImage *aNormalBgImage = (nil == normalBgImage ? defaultBgImage : normalBgImage);

    // 设置frame
    CGRect aFrame = CGRectZero;
    CGFloat aMax = ceil( maxWidth > 0.0f ? maxWidth : defaultWidth);
    aFrame.size.width = aMax;
    aFrame.size.height = ceil( height > 0.0f ? height : defaultHeight);
    
    UIButton *button = [[UIButton alloc] initWithFrame:aFrame];
    button.exclusiveTouch = YES;
    button.titleLabel.font = aFont;
    // 设置TitleColor
    if (aColor) {
        [button setTitleColor:aColor forState:UIControlStateNormal];
    }
    if (selectedColor) {
        [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
        [button setTitleColor:selectedColor forState:UIControlStateHighlighted|UIControlStateSelected];
    }
    if (disabledColor) {
        [button setTitleColor:disabledColor forState:UIControlStateDisabled];
    }
    
    // 设置BackgroundImage
    [button setBackgroundImage:[aNormalBgImage ff_centerStretchImage] forState:UIControlStateNormal];
    
    if (selectedBgImage) {
        [button setBackgroundImage:[selectedBgImage ff_centerStretchImage] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[selectedBgImage ff_centerStretchImage] forState:UIControlStateSelected];
        [button setBackgroundImage:[selectedBgImage ff_centerStretchImage] forState:UIControlStateHighlighted|UIControlStateSelected];
    }
    if (disabledBgImage) {
        [button setBackgroundImage:[disabledBgImage ff_centerStretchImage] forState:UIControlStateDisabled];
    }
    
    button.ff_width_scalable = maxWidth > minWidth;
    button.ff_max_width = ceil(maxWidth);
    button.ff_min_width = ceil(minWidth);
    if (button.ff_width_scalable) {
        button.ff_edge_width = ceil(edge <= 0.0f ? defaultEdge : edge);
    }
    
    return button;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.ff_hitEdgeOutsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    UIEdgeInsets edge = self.ff_hitEdgeOutsets;
    edge.top = -edge.top;
    edge.bottom = -edge.bottom;
    edge.left = -edge.left;
    edge.right = -edge.right;
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, edge);
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - Instance
+ (instancetype)ff_buttonWithSize:(CGSize)size
                     cornerRadius:(CGFloat)radius
                             font:(UIFont *)font
                      normalColor:(UIColor *)normalColor
                    selectedColor:(UIColor *)selectedColor
                    disabledColor:(UIColor *)disabledColor
                    normalBgColor:(UIColor *)normalBgColor
                  selectedBgColor:(UIColor *)selectedBgColor
                  disabledBgColor:(UIColor *)disabledBgColor {
    return [self ff_buildWithMinWidth:size.width
                             maxWidth:size.width
                                 edge:0.0f
                               height:size.height
                                 font:font
                          normalColor:normalColor
                        selectedColor:selectedColor
                        disabledColor:disabledColor
                        normalBgImage:[UIImage ff_imageWithColor:normalBgColor cornerRadius:radius]
                      selectedBgImage:[UIImage ff_imageWithColor:selectedBgColor cornerRadius:radius]
                      disabledBgImage:[UIImage ff_imageWithColor:disabledBgColor cornerRadius:radius]];
}

+ (instancetype)ff_buttonWithSize:(CGSize)size
                             font:(UIFont *)font
                      normalColor:(UIColor *)normalColor
                    selectedColor:(UIColor *)selectedColor
                    disabledColor:(UIColor *)disabledColor
                    normalBgImage:(UIImage *)normalBgImage
                  selectedBgImage:(UIImage *)selectedBgImage
                  disabledBgImage:(UIImage *)disabledBgImage {
    return [self ff_buildWithMinWidth:size.width
                             maxWidth:size.width
                                 edge:0.0f
                               height:size.height
                                 font:font
                          normalColor:normalColor
                        selectedColor:selectedColor
                        disabledColor:disabledColor
                        normalBgImage:normalBgImage
                      selectedBgImage:selectedBgImage
                      disabledBgImage:disabledBgImage];
}

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
                      disabledBgColor:(UIColor *)disabledBgColor {
    return [self ff_buildWithMinWidth:minWidth
                             maxWidth:maxWidth
                                 edge:edge
                               height:height
                                 font:font
                          normalColor:normalColor
                        selectedColor:selectedColor
                        disabledColor:disabledColor
                        normalBgImage:[UIImage ff_imageWithColor:normalBgColor cornerRadius:radius]
                      selectedBgImage:[UIImage ff_imageWithColor:selectedBgColor cornerRadius:radius]
                      disabledBgImage:[UIImage ff_imageWithColor:disabledBgColor cornerRadius:radius]];
}

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
                      disabledBgImage:(UIImage *)disabledBgImage {
    return [self ff_buildWithMinWidth:minWidth
                             maxWidth:maxWidth
                                 edge:edge
                               height:height
                                 font:font
                          normalColor:normalColor
                        selectedColor:selectedColor
                        disabledColor:disabledColor
                        normalBgImage:normalBgImage
                      selectedBgImage:selectedBgImage
                      disabledBgImage:disabledBgImage];
}

- (void)ff_sizeToFit {
    // 不允许缩放
    if (!self.ff_width_scalable) {
        return ;
    }
    
    NSString *text = self.currentTitle;
    if (!text) {
        text = @"";
    }
    
    CGRect frame = self.frame;
    
    CGFloat maxWidth = [self ff_max_width];
    CGFloat minWidth = [self ff_min_width];
 
    CGSize size = [text ff_sizeWithFont:self.titleLabel.font maxWidth:maxWidth];
    
    // 根据内间距调整一下宽度
    CGFloat edge = [self ff_edge_width];
    if (size.width + 2*edge < minWidth) { // 小于最小宽度适配最小宽度
        frame.size.width = minWidth;
    }
    else if (size.width + 2*edge > maxWidth){ // 大于最大宽度适配最大宽度
        frame.size.width = maxWidth;
    }
    else {
        frame.size.width = size.width + 2*edge;
    }
    
    self.frame = frame;
}

- (void)ff_addTarget:(id)target touchAction:(SEL)selector {
    if (target) {
        [self removeTarget:target action:NULL forControlEvents:UIControlEventTouchUpInside];
    }
    [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - getter & setter
- (BOOL)ff_width_scalable {
    return [[self associatedObjectForKey:@"ff_width_scalable"] boolValue];
}
- (void)setFf_width_scalable:(BOOL)ff_width_scalable {
    NSNumber *number = [NSNumber numberWithBool:ff_width_scalable];
    [self associateStrongNonatomicObject:number withKey:@"ff_width_scalable"];
}

- (CGFloat)ff_max_width {
    return [[self associatedObjectForKey:@"ff_max_width"] floatValue];
}
- (void)setFf_max_width:(CGFloat)ff_max_width {
    NSNumber *number = [NSNumber numberWithFloat:ff_max_width];
    [self associateStrongNonatomicObject:number withKey:@"ff_max_width"];
}

- (CGFloat)ff_min_width {
    return [[self associatedObjectForKey:@"ff_min_width"] floatValue];
}
- (void)setFf_min_width:(CGFloat)ff_min_width {
    NSNumber *number = [NSNumber numberWithFloat:ff_min_width];
    [self associateStrongNonatomicObject:number withKey:@"ff_min_width"];
}

- (CGFloat)ff_edge_width {
    return [[self associatedObjectForKey:@"ff_edge_width"] floatValue];
}
- (void)setFf_edge_width:(CGFloat)ff_edge_width {
    NSNumber *number = [NSNumber numberWithFloat:ff_edge_width];
    [self associateStrongNonatomicObject:number withKey:@"ff_edge_width"];
}

#pragma mark - public getter & setter
- (UIEdgeInsets)ff_hitEdgeOutsets {
    NSValue * value = [self associatedObjectForKey:@"ff_hitEdgeOutsets"];
    if(value) {
        return [value UIEdgeInsetsValue];
    }
    return UIEdgeInsetsZero;
}

- (void)setFFHitEdgeOutsets:(UIEdgeInsets)hitEdgeOutsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:hitEdgeOutsets];
    [self associateStrongNonatomicObject:value withKey:@"ff_hitEdgeOutsets"];
}

- (NSString *)ff_normalTitle {
    return [self titleForState:UIControlStateNormal];
}
- (void)setFFNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (UIColor *)ff_normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}
- (void)setFFNormalTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (UIImage *)ff_normalImage {
    return [self imageForState:UIControlStateNormal];
}
- (void)setFFNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)ff_normalBackgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}
- (void)setFFNormalBackgroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (NSString *)ff_selectedTitle {
    return [self titleForState:UIControlStateHighlighted];
}
- (void)setFFSelectedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateSelected];
    [self setTitle:title forState:UIControlStateHighlighted|UIControlStateSelected];
}

- (UIColor *)ff_selectedTitleColor {
    return [self titleColorForState:UIControlStateHighlighted];
}
- (void)setFFSelectedTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateSelected];
    [self setTitleColor:color forState:UIControlStateHighlighted|UIControlStateSelected];
}

- (UIImage *)ff_selectedImage {
    return [self imageForState:UIControlStateHighlighted];
}
- (void)setFFSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateHighlighted];
    [self setImage:image forState:UIControlStateSelected];
    [self setImage:image forState:UIControlStateHighlighted|UIControlStateSelected];
}

- (UIImage *)ff_selectedBackgroundImage {
    return [self backgroundImageForState:UIControlStateHighlighted];
}
- (void)setFFSelectedBackgroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
    [self setBackgroundImage:image forState:UIControlStateSelected];
    [self setBackgroundImage:image forState:UIControlStateHighlighted|UIControlStateSelected];
}

- (NSString *)ff_disabledTitle {
    return [self titleForState:UIControlStateDisabled];
}
- (void)setFFDisabledTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateDisabled];
}

- (UIColor *)ff_disabledTitleColor {
    return [self titleColorForState:UIControlStateDisabled];
}
- (void)setFFDisabledTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateDisabled];
}

- (UIImage *)ff_disabledImage {
    return [self imageForState:UIControlStateDisabled];
}
- (void)setFFDisabledImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateDisabled];
}

- (UIImage *)ff_disabledBackgroundImage {
    return [self backgroundImageForState:UIControlStateDisabled];
}
- (void)setFFDisabledBackgroundImage:(UIImage *)image {
    [self setBackgroundImage:image forState:UIControlStateDisabled];
}



@end
