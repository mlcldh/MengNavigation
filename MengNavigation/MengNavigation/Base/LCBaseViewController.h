//
//  LCBaseViewController.h
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/27.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBaseViewController : UIViewController

//导航栏是否隐藏
@property (nonatomic, assign) BOOL lc_navBarHidden;
//返回item
@property (nonatomic, strong) UIBarButtonItem *backItem;

@end
