//
//  UIViewController+LC.h
//  MengNavigation
//
//  Created by MengLingChao on 2019/3/27.
//  Copyright © 2019 MengLingChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LC)

/**是否隐藏导航栏*/
@property (nonatomic) BOOL lc_hideNavigationBar;
/**是否禁用左边缘拖动返回*/
@property (nonatomic) BOOL lc_disableInteractivePopGestureRecognizer;
///***/
//- (void)lc_setDisableInteractivePopGestureRecognizer:(BOOL)disabled;

@end
