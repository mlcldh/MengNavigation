//
//  LCNavigationController.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation LCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.delegate = self;
//
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.delegate = nil;
//        self.interactivePopGestureRecognizer.enabled = YES;
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}
- (BOOL)prefersStatusBarHidden {
    return [self.topViewController prefersStatusBarHidden];
}
// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.enabled = YES;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSArray *viewControllers = navigationController.viewControllers;
//        if ([viewControllers count] > 0) {
//            UIViewController * rootvc = [viewControllers objectAtIndex:0];
//            if (viewController == navigationController || (viewController == rootvc && [viewControllers count] == 1)) {
//                self.interactivePopGestureRecognizer.enabled = NO;
//            } else {
//                self.interactivePopGestureRecognizer.enabled = ![self forbidBackGesture:viewController];
//            }
//        }
//    });
}

@end
