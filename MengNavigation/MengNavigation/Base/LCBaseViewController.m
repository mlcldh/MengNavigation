//
//  LCBaseViewController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCBaseViewController.h"
#import "UIViewController+LC.h"

@interface LCBaseViewController ()

@end

@implementation LCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItems = @[self.backItem];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIBarButtonItem *)backItem {
    if (!_backItem) {
        //        _backItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:(UIBarButtonItemStylePlain) target:self action:@selector(popAction:)];
        _backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"lc_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
        //        _backItem.tintColor = [UIColor whiteColor];//返回按钮
    }
    return _backItem;
}
#pragma mark - Action
- (void)popAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
