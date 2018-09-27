//
//  TwoViewController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "Masonry.h"

@interface TwoViewController ()

@property (nonatomic,strong) UIButton *button;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor purpleColor];
    self.lc_navBarHidden = YES;
    [self button];
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
#pragma mark - Event
- (void)buttonAction:(UIButton *)button {
    ThreeViewController *twoVC = [[ThreeViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

@end
