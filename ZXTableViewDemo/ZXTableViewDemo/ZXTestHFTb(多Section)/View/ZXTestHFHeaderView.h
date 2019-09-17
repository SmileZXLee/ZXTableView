//
//  ZXTestHFHeaderView.h
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXTestHFHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic)NSNumber *section;
@end

NS_ASSUME_NONNULL_END
