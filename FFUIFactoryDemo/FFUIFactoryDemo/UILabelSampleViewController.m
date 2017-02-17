//
//  UILabelSampleViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/26.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UILabelSampleViewController.h"
#import "FFUIFactory.h"
#import "Masonry.h"

@interface UILabelSampleViewController ()

// 固定size单行
@property (nonatomic, strong) UILabel *constSizeAndSingleLineLabel;
// 固定宽度和行数
@property (nonatomic, strong) UILabel *constWidthAndLineLabel;
// 固定宽度可变行数
@property (nonatomic, strong) UILabel *constWidthAndAutoLineLabel;
// 可变宽度可变行数
@property (nonatomic, strong) UILabel *autoWidthAndLineLabel;
// 使用约束创建的
@property (nonatomic, strong) UILabel *usemasLabel;

@end

@implementation UILabelSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 固定size，且只有一行，没有可变因子，调用自适应方法不改变frame
    [self.view addSubview:self.constSizeAndSingleLineLabel];
    [self.constSizeAndSingleLineLabel ff_sizeToFit];
    
    // 自动根据numberOfLine调整高度
    [self.view addSubview:self.constWidthAndLineLabel];
    [self.constWidthAndLineLabel ff_sizeToFit];
    
    // 不限制行数，根据宽度和内容自动调整高度
    [self.view addSubview:self.constWidthAndAutoLineLabel];
    [self.constWidthAndAutoLineLabel ff_sizeToFit];
    
    // 根据内容调整宽度和行数
    [self.view addSubview:self.autoWidthAndLineLabel];
    [self.autoWidthAndLineLabel ff_sizeToFit];
    
    // 约束优先级最高
    [self.view addSubview:self.usemasLabel];
    [_usemasLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@200);
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.autoWidthAndLineLabel.mas_bottom).offset(50);
    }];
    [self.usemasLabel ff_sizeToFit];
}

- (UILabel *)constSizeAndSingleLineLabel{
    if (_constSizeAndSingleLineLabel == nil) {
        _constSizeAndSingleLineLabel = [UILabel ff_labelWithWidth:100 font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backgroudColor:[UIColor blackColor] alignment:NSTextAlignmentLeft numberOfLines:1];
        _constSizeAndSingleLineLabel.ff_height = 20;
        _constSizeAndSingleLineLabel.ff_centerX = self.view.ff_centerX;
        _constSizeAndSingleLineLabel.ff_y = 100;
        _constSizeAndSingleLineLabel.text = @"长度一定要够长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
    }
    return _constSizeAndSingleLineLabel;
}

- (UILabel *)constWidthAndLineLabel{
    if (_constWidthAndLineLabel == nil) {
        _constWidthAndLineLabel = [UILabel ff_labelWithWidth:300 font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backgroudColor:[UIColor blackColor] alignment:NSTextAlignmentLeft numberOfLines:2];
        _constWidthAndLineLabel.ff_centerX = self.view.ff_centerX;
        _constWidthAndLineLabel.ff_y = self.constSizeAndSingleLineLabel.ff_bottom+20;
        _constWidthAndLineLabel.text = @"长度一定要够长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
    }
    return _constWidthAndLineLabel;
}

- (UILabel *)constWidthAndAutoLineLabel{
    if (_constWidthAndAutoLineLabel == nil) {
        _constWidthAndAutoLineLabel = [UILabel ff_labelWithWidth:200 font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backgroudColor:[UIColor blackColor] alignment:NSTextAlignmentLeft numberOfLines:0];
        _constWidthAndAutoLineLabel.ff_centerX = self.view.ff_centerX;
        _constWidthAndAutoLineLabel.ff_y = self.constWidthAndLineLabel.ff_bottom+20;
        _constWidthAndAutoLineLabel.text = @"长度一定要够长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
    }
    return _constWidthAndAutoLineLabel;
}

- (UILabel *)autoWidthAndLineLabel{
    if (_autoWidthAndLineLabel == nil) {
        _autoWidthAndLineLabel = [UILabel ff_labelWithMinWidth:100 maxWidth:[[UIScreen mainScreen] bounds].size.width font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backgroudColor:[UIColor blackColor] alignment:NSTextAlignmentLeft numberOfLines:0];
        _autoWidthAndLineLabel.ff_centerX = self.view.ff_centerX;
        _autoWidthAndLineLabel.ff_y = self.constWidthAndAutoLineLabel.ff_bottom+20;
        _autoWidthAndLineLabel.text = @"长度一定要够长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
    }
    return _autoWidthAndLineLabel;
}

- (UILabel *)usemasLabel{
    if (_usemasLabel == nil) {
        _usemasLabel = [UILabel ff_labelWithWidth:200 font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backgroudColor:[UIColor blackColor] alignment:NSTextAlignmentLeft numberOfLines:0];
        
        _usemasLabel.ff_centerX = self.view.ff_centerX;
        _usemasLabel.ff_y = self.autoWidthAndLineLabel.ff_bottom+20;
        _usemasLabel.text = @"长度一定要够长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长";
    }
    return _usemasLabel;
}

@end
