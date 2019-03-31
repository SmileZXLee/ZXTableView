//
//  ZXTestSingleTbVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestSingleTbVC.h"
#import "ZXTableView.h"

#import "ZXTestSingleTbCell.h"
#import "ZXTestSingleTbModel.h"
@interface ZXTestSingleTbVC ()
@property (weak, nonatomic) IBOutlet ZXTableView *tableView;

@end

@implementation ZXTestSingleTbVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setTableViewData];
}

-(void)setTableView{
    //设置cell是什么类
    self.tableView.zx_setCellClassAtIndexPath = ^Class (NSIndexPath *  indexPath) {
        return [ZXTestSingleTbCell class];
    };
    __weak __typeof(self) weakSelf = self;
    //获取cell对象并对其进行处理
    self.tableView.zx_getCellAtIndexPath = ^(NSIndexPath *indexPath, ZXTestSingleTbCell *cell, id model) {
        cell.delBlock = ^{
            [weakSelf.tableView.zxDatas removeObjectAtIndex:indexPath.row];
            [weakSelf.tableView reloadData];
        };
    };
    
    //根据屏幕大小动态设置cell的高度，此处是定义IPhone 8的屏幕大小为1，若所有的cell都需要按照比例设置高度，建议在cell的模型中定义cellH属性，ZXTableView会自动对其赋值，然后您可以重写cellH的set方法，进而统一更改cellH的值，这个数据源model可以写一个父类，所有的cell模型都继承于这个类即可
    CGFloat sizeScale = [UIScreen mainScreen].bounds.size.width / 375;
    self.tableView.zx_setCellHAtIndexPath = ^CGFloat(NSIndexPath *indexPath) {
        return 70 * sizeScale;
    };
}

#pragma mark 设置数据源
-(void)setTableViewData{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *dataArr = [NSMutableArray array];
        for(NSUInteger i = 0;i < 20;i++){
            ZXTestSingleTbModel *model = [[ZXTestSingleTbModel alloc]init];
            model.name = [NSString stringWithFormat:@"小明%lu",i];
            model.goodAt = [NSString stringWithFormat:@"跑步%lu",i];
            model.iconImg = [UIImage imageNamed:@"tb_icon"];
            [dataArr addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableView.zxDatas = dataArr;
        });
    });
    
}

@end
