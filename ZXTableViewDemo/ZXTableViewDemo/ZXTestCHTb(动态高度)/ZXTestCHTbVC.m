//
//  ZXTestCHTbVC.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/31.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestCHTbVC.h"
#import "ZXTableView.h"

#import "ZXTestCHTbCell.h"
#import "ZXTestCHTbModel.h"
#import "ZXTestCHTbSpaceHeader.h"
@interface ZXTestCHTbVC ()
@property (weak, nonatomic) IBOutlet ZXTableView *tableView;
@end

@implementation ZXTestCHTbVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setTableViewData];
}

#pragma mark 设置TableView
-(void)setTableView{
    //声明cell是什么类
    self.tableView.zx_setCellClassAtIndexPath = ^Class (NSIndexPath *  indexPath) {
        return [ZXTestCHTbCell class];
    };
    //声明HeaderView是什么类
    self.tableView.zx_setHeaderClassInSection = ^Class(NSInteger section) {
        return [ZXTestCHTbSpaceHeader class];
    };
}

#pragma mark 设置数据源
-(void)setTableViewData{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *dataArr = [NSMutableArray array];
        for(NSUInteger i = 0;i < 10;i++){
            ZXTestCHTbModel *model = [[ZXTestCHTbModel alloc]init];
            model.name = [NSString stringWithFormat:@"小明%lu",i];
            model.time = [self getCurrentTime];
            model.iconImg = [UIImage imageNamed:@"tb_icon"];
            model.comment = [self getRanStrWithLength:(arc4random() % 200) + 10];
            [dataArr addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableView.zxDatas = [@[dataArr,dataArr,dataArr,dataArr,dataArr] mutableCopy];
        });
    });
}

#pragma mark - private
#pragma mark 生成随机字符串
-(NSString *)getRanStrWithLength:(NSInteger)len {
    NSString *chars = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *ranStr = [NSMutableString stringWithCapacity: len];
    for (NSInteger i = 0; i < len; i++) {
        [ranStr appendFormat: @"%C", [chars characterAtIndex: arc4random_uniform((int)[chars length])]];
    }
    return ranStr;
}

#pragma mark 获取当前时间
-(NSString *)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *now = [NSDate date];
    return [formatter stringFromDate:now];
}

@end
