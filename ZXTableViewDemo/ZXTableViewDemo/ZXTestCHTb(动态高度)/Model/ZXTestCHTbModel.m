//
//  ZXTestCHTbModel.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/31.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestCHTbModel.h"

@implementation ZXTestCHTbModel
-(void)setComment:(NSString *)comment{
    _comment = comment;
    CGFloat commentH = [self getStrHeightWithText:comment font:[UIFont systemFontOfSize:14] viewWidth:[UIScreen mainScreen].bounds.size.width - 15 * 2];
    //此处将计算的cell高度赋值给cellH即可
    self.cellH = commentH + 10 * 2 + 50;
    
}

- (CGFloat)getStrHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    return  ceilf(size.height);
}
@end
