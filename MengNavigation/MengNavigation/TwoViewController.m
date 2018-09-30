//
//  TwoViewController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "LCNavigationBar.h"
#import "UIColor+LC.h"
#import "Masonry.h"

@interface TwoViewController ()

@property (nonatomic, strong) LCNavigationBar *navigationBar;//
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *disablePopLabel;
@property (nonatomic,strong) UISwitch *disablePopSwitch;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.leftBarButtonItems = nil;
    self.hideNavigationBar = YES;
    [self button];
    [self disablePopLabel];
    [self disablePopSwitch];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (LCNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[LCNavigationBar alloc]init];
        _navigationBar.navigationItem.title = self.title;
        self.backItem.tintColor = [UIColor whiteColor];
        _navigationBar.navigationItem.leftBarButtonItems = @[self.backItem];
//        [_navigationBar setShadowImage:[UIImage new]];
        UIImage *colorImage = [[UIColor colorWithRed:46/255.f green:131/255.f blue:243/255.f alpha:1] lc_imageWithSize:CGSizeMake(1, 1)];
        [_navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
//        if (@available(iOS 11.0, *)) {
//            _navigationBar.prefersLargeTitles = YES;
//        }
        [self.view addSubview:_navigationBar];
        [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.equalTo(self.mas_topLayoutGuide);
            }
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(44);
        }];
    }
    return _navigationBar;
}
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button.backgroundColor = [UIColor purpleColor];
        [_button setTitle:@"push" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.navigationBar.mas_bottom);
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
    self.disableInteractivePopGestureRecognizer = aSwitch.on;
    self.navigationController.interactivePopGestureRecognizer.enabled = !aSwitch.on;
}

@end
