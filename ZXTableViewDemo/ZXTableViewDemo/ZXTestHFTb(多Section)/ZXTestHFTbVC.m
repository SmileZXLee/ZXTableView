//
//  ZXTestHFTbVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestHFTbVC.h"
#import "ZXTableView.h"
#import "ZXTestSingleTbCell.h"
#import "ZXTestSingleTbModel.h"
#import "ZXTestHFHeaderView.h"
#import "ZXTestHFFooterView.h"
@interface ZXTestHFTbVC ()
@property (weak, nonatomic) IBOutlet ZXTableView *tableView;
@end

@implementation ZXTestHFTbVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setTableViewData];
}

#pragma mark 设置TableView
-(void)setTableView{
    //设置cell是什么类
    self.tableView.zx_setCellClassAtIndexPath = ^Class (NSIndexPath *  indexPath) {
        return [ZXTestSingleTbCell class];
    };
    //设置HeaderView是什么类
    self.tableView.zx_setHeaderClassInSection = ^Class(NSInteger section) {
        return [ZXTestHFHeaderView class];
    };
    //设置FooterView是什么类
    self.tableView.zx_setFooterClassInSection = ^Class(NSInteger section) {
        return [ZXTestHFFooterView class];
    };
    //获取HeaderView对象并对其进行处理
    self.tableView.zx_getHeaderViewInSection = ^(NSUInteger section, ZXTestHFHeaderView *headerView, NSMutableArray *secArr) {
        headerView.headerLabel.text = [NSString stringWithFormat:@"HeaderView--%lu",section];
    };
    //获取FooterView对象并对其进行处理
    self.tableView.zx_getFooterViewInSection = ^(NSUInteger section, ZXTestHFFooterView *footerView, NSMutableArray *secArr) {
        footerView.footerLabel.text = [NSString stringWithFormat:@"FooterView--%lu",section];
    };
    //设置cell的高度（非必须）
    self.tableView.zx_setCellHAtIndexPath = ^CGFloat(NSIndexPath *indexPath) {
        return 70;
    };
}

#pragma mark 设置数据源
-(void)setTableViewData{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *dataArr = [NSMutableArray array];
        for(NSUInteger i = 0;i < 10;i++){
            NSMutableArray *secArr = [NSMutableArray array];
            for(NSUInteger j = 0;j < 5;j++){
                ZXTestSingleTbModel *model = [[ZXTestSingleTbModel alloc]init];
                model.name = [NSString stringWithFormat:@"小明section-%lu,row-%lu",i,j];
                model.goodAt = [NSString stringWithFormat:@"跑步section-%lu,row-%lu",i,j];
                model.iconImg = [UIImage imageNamed:@"tb_icon"];
                [secArr addObject:model];
            }
            [dataArr addObject:secArr];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableView.zxDatas = dataArr;
        });
    });
}
@end
