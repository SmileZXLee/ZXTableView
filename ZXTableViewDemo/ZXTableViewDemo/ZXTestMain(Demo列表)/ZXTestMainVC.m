//
//  ZXTestMainVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestMainVC.h"
#import "ZXTableView.h"
#import "ZXTestMainCell.h"

#import "ZXTestSingleTbVC.h"
#import "ZXTestHFTbVC.h"
#import "ZXTestCHTbVC.h"
#import "ZXCustomTbVC.h"

@interface ZXTestMainVC ()
@property (weak, nonatomic) IBOutlet ZXTableView *tableView;

@end

@implementation ZXTestMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZXTableViewDemo";
    [self setTableView];
    self.tableView.zxDatas = [self getTableViewData];
}
#pragma mark 设置TableView
-(void)setTableView{
    //设置cell是什么类
    self.tableView.zx_setCellClassAtIndexPath = ^Class (NSIndexPath *  indexPath) {
        return [ZXTestMainCell class];
    };
    __weak __typeof(self) weakSelf = self;
    //点击了某一行cell
    self.tableView.zx_didSelectedAtIndexPath = ^(NSIndexPath *indexPath, NSString *model, id cell) {
        UIViewController *VC;
        switch (indexPath.row) {
            case 0:{
                //单一Cell示例
                VC = [[ZXTestSingleTbVC alloc]init];
                break;
            }
            case 1:{
                //多section示例
                VC = [[ZXTestHFTbVC alloc]init];
                break;
            }
            case 2:{
                //Cell动态高度示例
                VC = [[ZXTestCHTbVC alloc]init];
                break;
            }
            case 3:{
                //自定义TableView
                VC = [[ZXCustomTbVC alloc]init];
                break;
            }
            default:
                break;
        }
        if(VC){
            VC.title = model;
            [weakSelf.navigationController pushViewController:VC animated:YES];
        }
    };
}
#pragma mark 设置数据源
-(NSMutableArray *)getTableViewData{
    NSArray *dataArr = @[@"单一Cell的TableView",@"多个Section的TableView",@"Cell高度动态改变的TableView",@"自定义TableView"];
    return [dataArr mutableCopy];
}
@end
