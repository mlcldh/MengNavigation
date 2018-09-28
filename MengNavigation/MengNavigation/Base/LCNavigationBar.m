//
//  LCNavigationBar.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/28.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCNavigationBar.h"

@interface LCNavigationBar ()<UINavigationBarDelegate>

@end

@implementation LCNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.tintColor = [UIColor whiteColor];
//        self.shadowImage = [[UIImage alloc] init];
        self.delegate = self;
        self.items = @[self.navigationItem];
    }
    return self;
}
#pragma mark - Getter
- (UINavigationItem *)navigationItem {
    if (!_navigationItem) {
        _navigationItem = [[UINavigationItem alloc] init];
    }
    return _navigationItem;
}
#pragma mark - UINavigationBarDelegate
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

@end
