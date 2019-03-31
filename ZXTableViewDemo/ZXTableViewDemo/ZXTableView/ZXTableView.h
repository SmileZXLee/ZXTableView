//
//  ZXTableView.h
//  ZXTableView
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTableView : UITableView
#pragma mark - 数据设置
///设置所有数据数组
@property(nonatomic, strong)NSMutableArray *zxDatas;
///设置对应cell的类
@property (nonatomic, copy) Class (^zx_setCellClassAtIndexPath)(NSIndexPath *indexPath);
///设置对应cell的高度(非必须，若设置了，则内部的自动计算高度无效)
@property (nonatomic, copy) CGFloat (^zx_setCellHAtIndexPath)(NSIndexPath *indexPath);
///设置section数量(非必须，若设置了，则内部自动设置section个数无效)
@property (nonatomic, copy) CGFloat (^zx_setNumberOfSectionsInTableView)(UITableView *tableView);
///设置对应section中row的数量(非必须，若设置了，则内部自动设置对应section中row的数量无效)
@property (nonatomic, copy) CGFloat (^zx_setNumberOfRowsInSection)(NSUInteger section);
///根据HeaderView类名设置HeaderView，写了此方法则zx_setHeaderViewInSection无效，无需实现zx_setHeaderHInSection，自动计算高度
@property (nonatomic, copy) Class (^zx_setHeaderClassInSection)(NSInteger section);
///根据FooterView类名设置FooterView，写了此方法则zx_setFooterViewInSection无效，无需实现zx_setFooterHInSection，自动计算高度
@property (nonatomic, copy) Class (^zx_setFooterClassInSection)(NSInteger section);
///设置HeaderView，必须实现zx_setHeaderHInSection
@property (nonatomic, copy) UIView *(^zx_setHeaderViewInSection)(NSInteger section);
///设置FooterView，必须实现zx_setFooterHInSection
@property (nonatomic, copy) UIView *(^zx_setFooterViewInSection)(NSInteger section);
///设置HeaderView高度，非必须，若设置了则自动设置的HeaderView高度无效
@property (nonatomic, copy) CGFloat (^zx_setHeaderHInSection)(NSInteger section);
///设置FooterView高度，非必须，若设置了则自动设置的FooterView高度无效
@property (nonatomic, copy) CGFloat (^zx_setFooterHInSection)(NSInteger section);
///禁止系统Cell自动高度 可以有效解决tableView跳动问题，默认为YES
@property(nonatomic, assign)BOOL zx_disableAutomaticDimension;
///无数据是否显示HeaderView，默认为YES
@property(nonatomic, assign)BOOL zx_showHeaderWhenNoMsg;
///无数据是否显示FooterView，默认为YES
@property(nonatomic, assign)BOOL zx_showFooterWhenNoMsg;
///设置tableView的style，UITableViewStyleGrouped可禁止HeaderView与FooterView自动吸附
#pragma mark - 数据获取
///获取对应行的cell，把id改成对应类名即可无需强制转换
@property (nonatomic, copy) void (^zx_getCellAtIndexPath)(NSIndexPath *indexPath,id cell,id model);
///获取对应section的headerView，把id改成对应类名即可无需强制转换，secArr为对应section的model数组
@property (nonatomic, copy) void (^zx_getHeaderViewInSection)(NSUInteger section,id headerView,NSMutableArray *secArr);
///获取对应section的footerView，把id改成对应类名即可无需强制转换，secArr为对应section的model数组
@property (nonatomic, copy) void (^zx_getFooterViewInSection)(NSUInteger section,id footerView,NSMutableArray *secArr);
#pragma mark - 代理事件相关
///选中某一行，把id改成对应类名即可无需强制转换
@property (nonatomic, copy) void (^zx_didSelectedAtIndexPath)(NSIndexPath *indexPath,id model,id cell);
///取消选中某一行，把id改成对应类名即可无需强制转换
@property (nonatomic, copy) void (^zx_didDeselectedAtIndexPath)(NSIndexPath *indexPath,id model,id cell);
///滑动删除
@property (nonatomic, copy) NSArray<UITableViewRowAction *>* (^zx_editActionsForRowAtIndexPath)(NSIndexPath *indexPath);
///cell将要展示，把id改成对应类名即可无需强制转换
@property (nonatomic, copy) void (^willDisplayCell)(NSIndexPath *indexPath,id cell);
///scrollView滚动事件
@property (nonatomic, copy) void (^zx_scrollViewDidScroll)(UIScrollView *scrollView);
///scrollView缩放事件
@property (nonatomic, copy) void (^zx_scrollViewDidZoom)(UIScrollView *scrollView);
///scrollView滚动到顶部事件
@property (nonatomic, copy) void (^zx_scrollViewDidScrollToTop)(UIScrollView *scrollView);
///scrollView开始拖拽事件
@property (nonatomic, copy) void (^zx_scrollViewWillBeginDragging)(UIScrollView *scrollView);
///scrollView开始拖拽事件
@property (nonatomic, copy) void (^zx_scrollViewDidEndDragging)(UIScrollView *scrollView, BOOL willDecelerate);
#pragma mark - UITableViewDataSource & UITableViewDelegate
///tableView的DataSource 设置为当前控制器即可重写对应数据源方法
@property (nonatomic, weak, nullable) id <UITableViewDataSource> zxDataSource;
///tableView的Delegate 设置为当前控制器即可重写对应代理方法
@property (nonatomic, weak, nullable) id <UITableViewDelegate> zxDelegate;
@end

