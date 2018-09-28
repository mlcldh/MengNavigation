//
//  UIColor+LC.m
//  MengNavigation
//
//  Created by MengLingChao on 2018/9/28.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "UIColor+LC.h"

@implementation UIColor (LC)

- (UIImage *)lc_imageWithSize:(CGSize)aSize {
    UIGraphicsBeginImageContext(aSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, aSize.width, aSize.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
