//
//  ZXXibTbVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2020/11/5.
//  Copyright © 2020 李兆祥. All rights reserved.
//

#import "ZXXibTbVC.h"
#import "ZXTableView.h"
@interface ZXXibTbVC ()
@property (weak, nonatomic) IBOutlet ZXTableView *tableView;

@end

@implementation ZXXibTbVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
}

- (void)setData{
    //cell，headerView和footerView的声明在ZXXibTbVC.xib的tableView中
    self.tableView.zxDatas = @[@"",@"",@""];
}

@end
