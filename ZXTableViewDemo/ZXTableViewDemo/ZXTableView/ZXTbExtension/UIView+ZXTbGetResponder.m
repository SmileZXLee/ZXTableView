//
//  UIView+ZXTbGetResponder.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/10/22.
//  Copyright © 2019 李兆祥. All rights reserved.
//  https://github.com/SmileZXLee/ZXTableView

#import "UIView+ZXTbGetResponder.h"

@implementation UIView (ZXTbGetResponder)
- (id)zx_getResponderWithClass:(Class)cls{
    for (UIView *next = self; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:cls]) {
            return nextResponder;
        }
    }
    return nil;
}

- (UIViewController *)zx_getVC{
    return [self zx_getResponderWithClass:[UIViewController class]];
}

- (UITableView *)zx_getTableView{
    return [self zx_getResponderWithClass:[UITableView class]];
}
@end
