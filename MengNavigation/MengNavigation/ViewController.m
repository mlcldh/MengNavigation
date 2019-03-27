//
//  ViewController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic,strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.navigationItem.leftBarButtonItems = @[self.leftBarButtonItem];
//    if (@available(iOS 11.0, *)) {
//        self.navigationController.navigationBar.prefersLargeTitles = YES;
//    }
    [self button];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
//- (UIBarButtonItem *)leftBarButtonItem {
//    if (!_leftBarButtonItem) {
////        UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
////        [customView setContentCompressionResistancePriority:(UILayoutPriorityRequired) forAxis:(UILayoutConstraintAxisHorizontal)];
////        UILabel *label = [[UILabel alloc]init];
////        label.text = @"首页成长";
////        [label setContentCompressionResistancePriority:(UILayoutPriorityRequired) forAxis:(UILayoutConstraintAxisHorizontal)];
////        [customView addSubview:label];
////        [label mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.edges.equalTo(customView);
//////            make.left.right.centerY.equalTo(customView);
////        }];
////        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
//        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"首页成长" style:(UIBarButtonItemStylePlain) target:nil action:nil];
//        _leftBarButtonItem.tintColor = [UIColor colorWithRed:0x2a/255.f green:0x33/255.f blue:0x3a/255.f alpha:1];
//        if (@available(iOS 10.0, *)) {
//        } else {
//            [_leftBarButtonItem setTitlePositionAdjustment:UIOffsetMake(8, 0) forBarMetrics:(UIBarMetricsDefault)];
//        }
//        [_leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]} forState:(UIControlStateNormal)];
//        //        _backItem.tintColor = [UIColor whiteColor];//返回按钮
//    }
//    return _leftBarButtonItem;
//}
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
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

@end
