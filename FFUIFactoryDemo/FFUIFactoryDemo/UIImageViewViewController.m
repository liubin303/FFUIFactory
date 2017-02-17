//
//  UIImageViewViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/26.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIImageViewViewController.h"
#import "FFUIFactory.h"
#import "Masonry.h"

@interface UIImageViewViewController ()

@property (nonatomic, strong) UIImageView *line1;
@property (nonatomic, strong) UIImageView *line2;
@property (nonatomic, strong) UIImageView *line3;
@property (nonatomic, strong) UIImageView *line4;

@property (nonatomic, strong) UIImageView *rect1;
@property (nonatomic, strong) UIImageView *rect2;
@property (nonatomic, strong) UIImageView *rect3;

@property (nonatomic, strong) UIImageView *circle1;
@property (nonatomic, strong) UIImageView *circle2;
@property (nonatomic, strong) UIImageView *circle3;

@property (nonatomic, strong) UIImageView *gradient1;
@property (nonatomic, strong) UIImageView *gradient2;
@property (nonatomic, strong) UIImageView *gradient3;

@end

@implementation UIImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.line1];
    [self.view addSubview:self.line2];
    [self.view addSubview:self.line3];
    [self.view addSubview:self.line4];
    
    [self.view addSubview:self.rect1];
    [self.view addSubview:self.rect2];
    [self.view addSubview:self.rect3];
    
    [self.view addSubview:self.circle1];
    [self.view addSubview:self.circle2];
    [self.view addSubview:self.circle3];
    
    [self.view addSubview:self.gradient1];
    [self.view addSubview:self.gradient2];
    [self.view addSubview:self.gradient3];
}

- (UIImageView *)line1{
    if (_line1 == nil) {
        _line1 = [UIImageView ff_lineWithWidth:150 color:[UIColor blackColor] orientation:UIInterfaceOrientationPortrait];
        _line1.ff_origin = CGPointMake(10, 100);
    }
    return _line1;
}

- (UIImageView *)line2{
    if (_line2 == nil) {
        _line2 = [UIImageView ff_lineWithWidth:150 color:[UIColor blackColor] orientation:UIInterfaceOrientationPortraitUpsideDown];
        _line2.ff_origin = CGPointMake(self.line1.ff_right + 10, 100);
    }
    return _line2;
}

- (UIImageView *)line3{
    if (_line3 == nil) {
        _line3 = [UIImageView ff_lineWithWidth:100 color:[UIColor blackColor] orientation:UIInterfaceOrientationLandscapeLeft];
        _line3.ff_origin = CGPointMake(10, self.line1.ff_bottom + 20);
    }
    return _line3;
}

- (UIImageView *)line4{
    if (_line4 == nil) {
        _line4 = [UIImageView ff_lineWithWidth:100 color:[UIColor blackColor] orientation:UIInterfaceOrientationLandscapeRight];
        _line4.ff_origin = CGPointMake(self.line3.ff_right + 100, self.line1.ff_bottom + 20);
    }
    return _line4;
}

- (UIImageView *)rect1{
    if (_rect1 == nil) {
        _rect1 = [UIImageView ff_imageViewWithImage:[UIImage ff_imageWithColor:[UIColor blackColor]]];
        _rect1.ff_size = CGSizeMake(100, 50);
        _rect1.ff_origin = CGPointMake(20, self.line3.ff_bottom + 20);
    }
    return _rect1;
}

- (UIImageView *)rect2{
    if (_rect2 == nil) {
        _rect2 = [UIImageView ff_imageViewWithImage:[[UIImage ff_imageWithColor:[UIColor blackColor] cornerRadius:5] ff_centerStretchImage]];
        _rect2.ff_size = CGSizeMake(100, 50);
        _rect2.ff_origin = CGPointMake(self.rect1.ff_right+20, self.rect1.ff_y);
    }
    return _rect2;
}

- (UIImageView *)rect3{
    if (_rect3 == nil) {
        _rect3 = [UIImageView ff_imageViewWithImage:[[UIImage ff_imageWithColor:[UIColor blackColor] border:1 color:[UIColor redColor] cornerRadius:5] ff_centerStretchImage]];
        _rect3.ff_size = CGSizeMake(100, 50);
        _rect3.ff_origin = CGPointMake(self.rect2.ff_right+20, self.rect1.ff_y);
    }
    return _rect3;
}

- (UIImageView *)circle1{
    if (_circle1 == nil) {
        _circle1 = [UIImageView ff_imageViewWithImage:[UIImage ff_circleWithDiameter:100 color:[UIColor greenColor]]];
        _circle1.ff_origin = CGPointMake(20, self.rect3.ff_bottom + 20);
    }
    return _circle1;
}

- (UIImageView *)circle2{
    if (_circle2 == nil) {
        _circle2 = [UIImageView ff_imageViewWithImage:[UIImage ff_circleLineWithDiameter:100 border:1 color:[UIColor darkGrayColor]]];
        _circle2.ff_origin = CGPointMake(_circle1.ff_right+20, _circle1.ff_y);
    }
    return _circle2;
}

- (UIImageView *)circle3{
    if (_circle3 == nil) {
        _circle3 = [UIImageView ff_imageViewWithImage:[UIImage ff_circleLineWithDiameter:100 border:1 color:[UIColor darkGrayColor] backgroudColor:[UIColor greenColor]]];
        _circle3.ff_origin = CGPointMake(_circle2.ff_right+20, _circle1.ff_y);
    }
    return _circle3;
}

- (UIImageView *)gradient1{
    if (_gradient1 == nil) {
        _gradient1 = [UIImageView ff_imageViewWithImage:[UIImage ff_imageWithSize:CGSizeMake(100, 50) gradientColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8] to:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] cornerRadius:5]];
        _gradient1.ff_origin = CGPointMake(20, _circle1.ff_bottom+20);
    }
    return _gradient1;
}

- (UIImageView *)gradient2{
    if (_gradient2 == nil) {
        _gradient2 = [UIImageView ff_imageViewWithImage:[UIImage ff_imageWithSize:CGSizeMake(100, 50) gradientColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8] to:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] border:1 color:[UIColor redColor] cornerRadius:5]];
        _gradient2.ff_origin = CGPointMake(_gradient1.ff_right+20, _gradient1.ff_y);
    }
    return _gradient2;
}

- (UIImageView *)gradient3{
    if (_gradient3 == nil) {
        _gradient3 = [UIImageView ff_imageViewWithImage:[UIImage ff_imageWithSize:CGSizeMake(100, 50) gradientColors:@[[UIColor blackColor],[UIColor grayColor]] gradientLocations:0 border:1 color:[UIColor redColor] blending:10 color:[UIColor greenColor] cornerRadius:5]];
        _gradient3.ff_size = CGSizeMake(100, 50);
        _gradient3.ff_origin = CGPointMake(_gradient2.ff_right+20, _gradient1.ff_y);
    }
    return _gradient3;
}


@end
