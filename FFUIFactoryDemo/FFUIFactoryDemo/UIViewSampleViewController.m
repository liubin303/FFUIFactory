//
//  UIViewSampleViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/26.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIViewSampleViewController.h"
#import "FFUIFactory.h"
#import "Masonry.h"

@interface UIViewSampleViewController ()

@property (nonatomic, strong) UIView *tapView;

@property (nonatomic, strong) UIView *seprateLineView;

@property (nonatomic, strong) UIView *animaView;

@end

@implementation UIViewSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tapView];
    [self.view addSubview:self.seprateLineView];
    [self.view addSubview:self.animaView];
    
    [self.tapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
    }];
    
    [self.animaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-100);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
    }];

    [self autoAnimation];
}

- (void)autoAnimation{
    void(^innerblock)(void) = ^void(void){
        [self autoAnimation];
    };
    if (_animaView.hidden) {
        [_animaView ff_fadeShowAnimationDuration:1.5 complete:innerblock];
    }else{
        [_animaView ff_fadeHideAnimationDuration:1.5 complete:innerblock];
    }
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    NSLog(@"did tap");
}

- (UIView *)tapView{
    if (_tapView == nil) {
        _tapView = [UIView ff_viewWithColor:[UIColor greenColor] frame:CGRectMake(0, 0, 200, 200)];
        // 添加手势
        [_tapView ff_addTapGestureWithTarget:self action:@selector(tapAction:)];
    }
    return _tapView;
}

- (UIView *)seprateLineView{
    if (_seprateLineView == nil) {
        _seprateLineView = [UIView ff_lineWithWidth:self.view.ff_width color:[UIColor redColor]];
        _seprateLineView.ff_origin = CGPointMake(0, self.view.ff_centerY);
    }
    return _seprateLineView;
}

- (UIView *)animaView{
    if (_animaView == nil) {
        _animaView = [UIView ff_viewWithColor:[UIColor blackColor]];
    }
    return _animaView;
}

@end
