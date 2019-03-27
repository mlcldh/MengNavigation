//
//  UIViewController+LC.m
//  MengNavigation
//
//  Created by MengLingChao on 2019/3/27.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import "UIViewController+LC.h"
#import <objc/runtime.h>

@implementation UIViewController (LC)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethodWithOriginalSelector:@selector(viewWillAppear:) newSelector:@selector(lc_viewWillAppear:)];
    });
}
+ (void)swizzleMethodWithOriginalSelector:(SEL)originalSelector newSelector:(SEL)newSelector {
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method newMethod = class_getInstanceMethod([self class], newSelector);
    IMP newMethodImp = method_getImplementation(newMethod);
    IMP originalMethodImp = method_getImplementation(originalMethod);
    BOOL addMethodSuccess = class_addMethod([self class], originalSelector, newMethodImp, method_getTypeEncoding(newMethod));
    if (addMethodSuccess) {
        class_replaceMethod([self class], newSelector, originalMethodImp, method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}
- (void)lc_viewWillAppear:(BOOL)animated {
    //避免childViewController影响导航条的显示效果，当前控制器只有在navigationController控制器栈里面才生效
    if ([self.navigationController.viewControllers indexOfObject:self] != NSNotFound) {
        [self.navigationController setNavigationBarHidden:self.lc_hideNavigationBar animated:YES];
    }
    [self lc_viewWillAppear:animated];
}
- (BOOL)lc_hideNavigationBar {
    NSNumber *hideNumber = objc_getAssociatedObject(self, _cmd);
    BOOL hide = [hideNumber boolValue];
    return hide;
}
- (void)setLc_hideNavigationBar:(BOOL)lc_hideNavigationBar {
    objc_setAssociatedObject(self, @selector(lc_hideNavigationBar), @(lc_hideNavigationBar), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (BOOL)lc_disableInteractivePopGestureRecognizer {
    NSNumber *disableNumber = objc_getAssociatedObject(self, _cmd);
    BOOL disable = [disableNumber boolValue];
    return disable;
}
- (void)setLc_disableInteractivePopGestureRecognizer:(BOOL)lc_disableInteractivePopGestureRecognizer {
    objc_setAssociatedObject(self, @selector(lc_disableInteractivePopGestureRecognizer), @(lc_disableInteractivePopGestureRecognizer), OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.navigationController.interactivePopGestureRecognizer.enabled = !lc_disableInteractivePopGestureRecognizer;
//    NSLog(@"%@,%@",self,self.navigationController.topViewController);
}

@end
