//
//  ZXCustomTbVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/10/14.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXCustomTbVC.h"
#import "ZXTestMainCell.h"
#import "ZXCustomTableView.h"
@interface ZXCustomTbVC ()
@property (weak, nonatomic) IBOutlet ZXCustomTableView *tableView;
@end

@implementation ZXCustomTbVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}

#pragma mark 设置TableView
-(void)setTableView{
    //设置cell是什么类
    self.tableView.zx_setCellClassAtIndexPath = ^Class (NSIndexPath *  indexPath) {
        return [ZXTestMainCell class];
    };
    self.tableView.zxDatas = [self getTableViewData];
}
#pragma mark 设置数据源
-(NSMutableArray *)getTableViewData{
    NSMutableArray *dataArr = [NSMutableArray array];
    for(int i = 0; i < 5;i++){
        [dataArr addObject:[NSString stringWithFormat:@"第%d行",i]];
    }
    return dataArr;
}

@end
