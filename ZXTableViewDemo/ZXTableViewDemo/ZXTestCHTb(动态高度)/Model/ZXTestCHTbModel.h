//
//  ZXTestCHTbModel.h
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/31.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZXTestCHTbModel : NSObject
@property (strong,nonatomic) UIImage *iconImg;
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *time;
@property (copy,nonatomic) NSString *comment;
@property (assign,nonatomic) CGFloat cellH;
@end

NS_ASSUME_NONNULL_END
