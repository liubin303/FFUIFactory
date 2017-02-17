//
//  UIButtonSampleViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/26.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIButtonSampleViewController.h"
#import "FFUIFactory.h"
#import "Masonry.h"

@interface UIButtonSampleViewController ()

@property (nonatomic, strong) UIButton *bgByColorBtn;

@property (nonatomic, strong) UIButton *bgByImageBtn;

@property (nonatomic, strong) UIButton *autoSizeBtn;

@end

@implementation UIButtonSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.autoSizeBtn];
    [self.autoSizeBtn ff_sizeToFit];
    self.autoSizeBtn.ff_centerX = self.view.ff_centerX;
    
    [self.view addSubview:self.bgByColorBtn];
    [self.bgByColorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.autoSizeBtn.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    
    [self.view addSubview:self.bgByImageBtn];
    [self.bgByImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgByColorBtn.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
}

- (void)buttonAction:(UIButton *)button{
    switch (button.tag) {
        case 1000:{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"响应成功" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self.navigationController presentViewController:alert animated:YES completion:nil];
            break;
        }
        case 1001:
            self.bgByImageBtn.enabled = !self.bgByImageBtn.enabled;
            break;
        case 1002:
            self.bgByColorBtn.enabled = !self.bgByColorBtn.enabled;
            break;
            
        default:
            break;
    }
}

#pragma mark - lazy load
- (UIButton *)autoSizeBtn{
    if (_autoSizeBtn == nil) {
        _autoSizeBtn = [UIButton ff_buttonWithMinWidth:50
                                              maxWidth:300
                                          cornerRadius:5
                                                  edge:0
                                                height:40
                                                  font:[UIFont systemFontOfSize:15]
                                           normalColor:[UIColor blackColor]
                                         selectedColor:[UIColor redColor]
                                         disabledColor:[UIColor grayColor]
                                         normalBgColor:[UIColor yellowColor]
                                       selectedBgColor:[UIColor greenColor]
                                       disabledBgColor:[UIColor lightGrayColor]];
        _autoSizeBtn.ff_centerX = self.view.ff_centerX;
        _autoSizeBtn.ff_top = 100;
        _autoSizeBtn.ff_normalTitle = @"点击按钮外围20像素试试";
        _autoSizeBtn.ff_selectedTitle = @"点击按钮外围20像素试试";
        _autoSizeBtn.ff_disabledTitle = @"disable title";
        _autoSizeBtn.ff_hitEdgeOutsets = UIEdgeInsetsMake(20, 20, 20, 20);
        _autoSizeBtn.tag = 1000;
        [_autoSizeBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _autoSizeBtn;
}

- (UIButton *)bgByColorBtn{
    if (_bgByColorBtn == nil) {
        _bgByColorBtn = [UIButton ff_buttonWithSize:CGSizeZero
                                       cornerRadius:5
                                               font:[UIFont systemFontOfSize:15]
                                        normalColor:[UIColor blackColor]
                                      selectedColor:[UIColor redColor]
                                      disabledColor:[UIColor grayColor]
                                      normalBgColor:[UIColor yellowColor]
                                    selectedBgColor:[UIColor greenColor]
                                    disabledBgColor:[UIColor lightGrayColor]];
        _bgByColorBtn.ff_normalTitle = @"normal title";
        _bgByColorBtn.ff_selectedTitle = @"select title";
        _bgByColorBtn.ff_disabledTitle = @"disable title";
        _bgByColorBtn.tag = 1001;
        [_bgByColorBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _bgByColorBtn;
}

- (UIButton *)bgByImageBtn{
    if (_bgByImageBtn == nil) {
        _bgByImageBtn = [UIButton ff_buttonWithSize:CGSizeZero
                                               font:[UIFont systemFontOfSize:15]
                                        normalColor:[UIColor blackColor]
                                      selectedColor:[UIColor redColor]
                                      disabledColor:[UIColor grayColor]
                                      normalBgImage:
                         [UIImage ff_imageWithColor:[UIColor yellowColor] border:1 color:[UIColor blackColor] cornerRadius:5]
                                    selectedBgImage:
                         [UIImage ff_imageWithColor:[UIColor greenColor] border:1 color:[UIColor yellowColor] cornerRadius:5]
                                    disabledBgImage:
                         [UIImage ff_imageWithColor:[UIColor lightGrayColor] border:1 color:[UIColor grayColor] cornerRadius:5]];
        _bgByImageBtn.ff_normalTitle = @"normal title";
        _bgByImageBtn.ff_selectedTitle = @"select title";
        _bgByImageBtn.ff_disabledTitle = @"disable title";
        _bgByImageBtn.tag = 1002;
        [_bgByImageBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _bgByImageBtn;
}


@end
