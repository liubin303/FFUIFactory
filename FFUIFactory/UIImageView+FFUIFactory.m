//
//  UIImageView+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIImageView+FFUIFactory.h"
#import "UIImage+FFUIFactory.h"

@implementation UIImageView (FFUIFactory)

#pragma mark - private
+ (instancetype)ff_buildWithSize:(CGSize)size image:(UIImage *)image {
    
    CGRect frame = CGRectZero;
    frame.size.width = (size.width <= 0.0f ? 40.0f : size.width);
    frame.size.height = (size.height <= 0.0f ? 40.0f : size.height);
    
    UIImageView *imageView = [[[self class] alloc] initWithFrame:frame];
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    return imageView;
}

#pragma mark - Instance
+ (instancetype)ff_imageViewWithWidth:(CGFloat)width {
    return [self ff_buildWithSize:CGSizeMake(width, width) image:nil];
}

+ (instancetype)ff_imageViewWithSize:(CGSize)size {
    return [self ff_buildWithSize:size image:nil];
}

+ (instancetype)ff_imageViewWithImage:(UIImage *)image {
    return [self ff_buildWithSize:image.size image:image];
}

+ (instancetype)ff_lineWithWidth:(CGFloat)width color:(UIColor *)color orientation:(UIInterfaceOrientation)orientation {
    UIImage *image = [UIImage ff_lineWithColor:color orientation:orientation];
    
    CGRect frame = CGRectZero;
    CGFloat aWidth = (width <= 0.0f ? 40.0f : width);
    if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {
        frame.size.height = aWidth;
        frame.size.width = 1;
    } else {
        frame.size.width = aWidth;
        frame.size.height = 1;
    }
    return [self ff_buildWithSize:frame.size image:image];;
}

@end
