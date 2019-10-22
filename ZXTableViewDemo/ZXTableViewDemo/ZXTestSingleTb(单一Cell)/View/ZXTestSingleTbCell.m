//
//  ZXTestSingleTbCell.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/30.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestSingleTbCell.h"
#import "ZXTestSingleTbModel.h"
@interface ZXTestSingleTbCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodAtLabel;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
//若cell中有包含model字符串的属性，则会自动将model赋值给它
@property (strong,nonatomic) ZXTestSingleTbModel *sTbModel;

@end
@implementation ZXTestSingleTbCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 100);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.delBtn.clipsToBounds = YES;
    self.delBtn.layer.cornerRadius = 2;
    self.delBtn.hidden = YES;
}
-(void)setSTbModel:(ZXTestSingleTbModel *)sTbModel{
    _sTbModel = sTbModel;
    self.iconImgV.image = sTbModel.iconImg;
    self.nameLabel.text = sTbModel.name;
    self.goodAtLabel.text = sTbModel.goodAt;
}
-(void)setDelBlock:(void (^)(void))delBlock{
    _delBlock = delBlock;
    self.delBtn.hidden = !delBlock;
}

- (IBAction)delAction:(id)sender {
    if(self.delBlock){
        self.delBlock();
    }
}

@end
