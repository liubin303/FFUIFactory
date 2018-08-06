//
//  ViewController.m
//  FFUIFactoryDemo
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 com.wanda.uifactory.demo. All rights reserved.
//

#import "ViewController.h"
#import "FFUIFactory.h"
#import "UIViewSampleViewController.h"
#import "UILabelSampleViewController.h"
#import "UIButtonSampleViewController.h"
#import "UIImageViewViewController.h"
#import "UITextFieldSampleViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *viewSampleBtn;
@property (nonatomic, strong) UIButton *labelSampleBtn;
@property (nonatomic, strong) UIButton *buttonSampleBtn;
@property (nonatomic, strong) UIButton *imageViewSampleBtn;
@property (nonatomic, strong) UIButton *textFieldBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FFUIFactory";
    
    [self.view addSubview:self.viewSampleBtn];
    [self.view addSubview:self.labelSampleBtn];
    [self.view addSubview:self.buttonSampleBtn];
    [self.view addSubview:self.imageViewSampleBtn];
    [self.view addSubview:self.textFieldBtn];
    
    self.viewSampleBtn.ff_centerX = self.view.ff_centerX;
    self.labelSampleBtn.ff_centerX = self.view.ff_centerX;
    self.buttonSampleBtn.ff_centerX = self.view.ff_centerX;
    self.imageViewSampleBtn.ff_centerX = self.view.ff_centerX;
    self.textFieldBtn.ff_centerX = self.view.ff_centerX;
    
    self.viewSampleBtn.ff_y = 100;
    self.labelSampleBtn.ff_y = self.viewSampleBtn.ff_bottom+30;
    self.buttonSampleBtn.ff_y = self.labelSampleBtn.ff_bottom+30;
    self.imageViewSampleBtn.ff_y = self.buttonSampleBtn.ff_bottom+30;
    self.textFieldBtn.ff_y = self.imageViewSampleBtn.ff_bottom+30;
    
    NSString *s = [NSString stringWithFormat:@"%.1f",1.00];
}

- (void)buttonAction:(UIButton *)button{
    UIViewController *sampleViewController = nil;
    switch (button.tag) {
        case 1001:{
            sampleViewController = [[UIViewSampleViewController alloc] init];
            break;
        }
        case 1002:{
            sampleViewController = [[UILabelSampleViewController alloc] init];
            break;
        }
        case 1003:{
            sampleViewController = [[UIButtonSampleViewController alloc] init];
            break;
        }
        case 1004:{
            sampleViewController = [[UIImageViewViewController alloc] init];
            break;
        }
        case 1005:{
            sampleViewController = [[UITextFieldSampleViewController alloc] init];
            break;
        }
        default:
            break;
    }
    sampleViewController.title = button.ff_normalTitle;
    [self.navigationController pushViewController:sampleViewController animated:YES];
}

- (UIButton *)viewSampleBtn{
    if (_viewSampleBtn == nil) {
        _viewSampleBtn = [self generateButton];
        _viewSampleBtn.tag = 1001;
        _viewSampleBtn.ff_normalTitle = @"UIView";
        [_viewSampleBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _viewSampleBtn;
}

- (UIButton *)labelSampleBtn{
    if (_labelSampleBtn == nil) {
        _labelSampleBtn = [self generateButton];
        _labelSampleBtn.tag = 1002;
        _labelSampleBtn.ff_normalTitle = @"UILabel";
        [_labelSampleBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _labelSampleBtn;
}

- (UIButton *)buttonSampleBtn{
    if (_buttonSampleBtn == nil) {
        _buttonSampleBtn = [self generateButton];
        _buttonSampleBtn.tag = 1003;
        _buttonSampleBtn.ff_normalTitle = @"UIButton";
        [_buttonSampleBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _buttonSampleBtn;
}

- (UIButton *)imageViewSampleBtn{
    if (_imageViewSampleBtn == nil) {
        _imageViewSampleBtn = [self generateButton];
        _imageViewSampleBtn.tag = 1004;
        _imageViewSampleBtn.ff_normalTitle = @"UIImageView";
        [_imageViewSampleBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _imageViewSampleBtn;
}

- (UIButton *)textFieldBtn{
    if (_textFieldBtn == nil) {
        _textFieldBtn = [self generateButton];
        _textFieldBtn.tag = 1005;
        _textFieldBtn.ff_normalTitle = @"UITextField";
        [_textFieldBtn ff_addTarget:self touchAction:@selector(buttonAction:)];
    }
    return _textFieldBtn;
}

- (UIButton *)generateButton{
    return [UIButton ff_buttonWithSize:CGSizeMake(150, 50) cornerRadius:5 font:[UIFont systemFontOfSize:15] normalColor:[UIColor whiteColor] selectedColor:[UIColor blackColor] disabledColor:nil normalBgColor:[UIColor blackColor] selectedBgColor:[UIColor whiteColor] disabledBgColor:nil];
}
@end
