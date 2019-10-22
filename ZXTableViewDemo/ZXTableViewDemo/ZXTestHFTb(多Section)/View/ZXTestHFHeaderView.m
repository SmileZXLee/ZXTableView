//
//  ZXTestHFHeaderView.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestHFHeaderView.h"
@implementation ZXTestHFHeaderView
- (void)setZx_sectionInTableView:(NSUInteger)zx_sectionInTableView{
    self.headerLabel.text = [NSString stringWithFormat:@"HeaderView--%lu",zx_sectionInTableView];;
}
@end
