//
//  ZXTestCHTbSpaceHeader.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/31.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestCHTbSpaceHeader.h"

@implementation ZXTestCHTbSpaceHeader

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self  = [super initWithFrame:frame]){
        self.frame = CGRectMake(0, 0, 0, 40);
        self.backgroundColor = [UIColor yellowColor];
        UILabel *sortLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (40 - 20) / 2.0, [UIScreen mainScreen].bounds.size.width - 20 * 2, 20)];
        [self addSubview:sortLabel];
        sortLabel.textColor = [UIColor colorWithRed:5 / 255.0 green:140 / 255.0 blue:255.0 / 2550 alpha:1];
        sortLabel.text = @"这是一个评论列表";
        self.sortLabel = sortLabel;
        NSLog(@"这是一个评论列表");
    }
    return self;
}
@end
