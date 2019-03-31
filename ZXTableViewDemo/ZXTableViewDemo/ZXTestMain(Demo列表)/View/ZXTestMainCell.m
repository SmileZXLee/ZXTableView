//
//  ZXTestMainCell.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestMainCell.h"
@interface ZXTestMainCell()
@property (weak, nonatomic) IBOutlet UILabel *demoTypeLabel;
//若cell中有包含model的属性，则会自动将model赋值给它
@property (copy, nonatomic) NSString *demoModel;
@end
@implementation ZXTestMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.demoTypeLabel.adjustsFontSizeToFitWidth = YES;
}

-(void)setDemoModel:(NSString *)demoModel{
    _demoModel = demoModel;
    self.demoTypeLabel.text = demoModel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
