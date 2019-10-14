//
//  ZXCustomTableView.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/10/14.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXCustomTableView.h"

@implementation ZXCustomTableView
//重写父类zx_setTableView，统一设置tableView样式和偏好
- (void)zx_setTableView{
    self.backgroundColor = [UIColor redColor];
    self.zx_autoDeselectWhenSelected = NO;
}
//重写父类zx_setTableView，统一设置cell样式和偏好
- (void)zx_setCell:(UITableViewCell *)cell{
    cell.backgroundColor = [UIColor greenColor];
}
@end
