//
//  LCBaseViewController.h
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBaseViewController : UIViewController

/**是否隐藏导航栏*/
@property (nonatomic) BOOL hideNavigationBar;
/**是否禁用左边缘拖动返回*/
@property (nonatomic) BOOL disableInteractivePopGestureRecognizer;
/**返回item*/
@property (nonatomic, strong) UIBarButtonItem *backItem;

@end
