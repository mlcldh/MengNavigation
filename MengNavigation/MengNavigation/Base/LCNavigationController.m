//
//  LCNavigationController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCNavigationController.h"
//#import "LCBaseViewController.h"
#import "UIViewController+LC.h"

@interface LCNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = nil;
    self.interactivePopGestureRecognizer.enabled = YES;
}
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return [self.topViewController preferredStatusBarStyle];
//}
//- (UIViewController *)childViewControllerForStatusBarHidden {
//    return self.topViewController;
//}
//- (BOOL)prefersStatusBarHidden {
//    return [self.topViewController prefersStatusBarHidden];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UINavigationControllerDelegate
// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *viewControllers = navigationController.viewControllers;
        if ([viewControllers count] > 0) {
            UIViewController *rootVC = viewControllers[0];
            if (viewController == navigationController || (viewController == rootVC && [viewControllers count] == 1)) {
                self.interactivePopGestureRecognizer.enabled = NO;
            } else {
                self.interactivePopGestureRecognizer.enabled = !viewController.lc_disableInteractivePopGestureRecognizer;
            }
        }
    });
}

@end
