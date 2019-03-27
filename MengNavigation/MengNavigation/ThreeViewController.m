//
//  ThreeViewController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ThreeViewController.h"
#import "UIViewController+LC.h"
#import "Masonry.h"

@interface ThreeViewController ()

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *disablePopLabel;
@property (nonatomic,strong) UISwitch *disablePopSwitch;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor cyanColor];
    [self button];
    [self disablePopLabel];
    [self disablePopSwitch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button.backgroundColor = [UIColor purpleColor];
        [_button setTitle:@"push" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }];
    }
    return _button;
}
- (UILabel *)disablePopLabel {
    if (!_disablePopLabel) {
        _disablePopLabel = [[UILabel alloc]init];
        _disablePopLabel.text = @"是否禁用左边缘拖动返回";
        [self.view addSubview:_disablePopLabel];
        [_disablePopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.button.mas_bottom).offset(20);
        }];
    }
    return _disablePopLabel;
}
- (UISwitch *)disablePopSwitch {
    if (!_disablePopSwitch) {
        _disablePopSwitch = [[UISwitch alloc]init];
        [_disablePopSwitch addTarget:self action:@selector(disablePopSwitchAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_disablePopSwitch];
        [_disablePopSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.disablePopLabel.mas_right).offset(20);
            make.top.equalTo(self.button.mas_bottom).offset(20);
        }];
    }
    return _disablePopSwitch;
}
#pragma mark - Event
- (void)buttonAction:(UIButton *)button {
    ThreeViewController *twoVC = [[ThreeViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}
#pragma mark - Action
- (void)disablePopSwitchAction:(UISwitch *)aSwitch {
    self.lc_disableInteractivePopGestureRecognizer = aSwitch.on;
    self.navigationController.interactivePopGestureRecognizer.enabled = !aSwitch.on;
}

@end
