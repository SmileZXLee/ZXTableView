//
//  UIView+ZXTbGetResponder.h
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/10/22.
//  Copyright © 2019 李兆祥. All rights reserved.
//  https://github.com/SmileZXLee/ZXTableView

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZXTbGetResponder)
///获取当前view所属的cls类型对象(最接近的父类)
- (id)zx_getResponderWithClass:(Class)cls;
///获取当前view所属的控制器
- (UIViewController *)zx_getVC;
///获取当前view所属的tableView
- (UITableView *)zx_getTableView;
@end

NS_ASSUME_NONNULL_END
