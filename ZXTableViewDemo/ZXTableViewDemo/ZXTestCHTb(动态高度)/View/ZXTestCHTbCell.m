//
//  ZXTestCHTbCell.m
//  ZXTableViewDemo
//
//  Created by 李兆祥 on 2019/3/31.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ZXTestCHTbCell.h"
#import "ZXTestCHTbModel.h"
@interface ZXTestCHTbCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

//若cell中有包含model的属性，则会自动将model赋值给它
@property (strong, nonatomic) ZXTestCHTbModel *cTbModel;
//若cell或model中包含indexPath属性，则会自动赋值
@property (strong, nonatomic) NSIndexPath *indexPath;
@end
@implementation ZXTestCHTbCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.indexLabel.adjustsFontSizeToFitWidth = YES;
    self.indexLabel.clipsToBounds = YES;
    self.indexLabel.layer.cornerRadius = 10;
}

-(void)setCTbModel:(ZXTestCHTbModel *)cTbModel{
    _cTbModel = cTbModel;
    self.iconImgV.image = cTbModel.iconImg;
    self.nameLabel.text = cTbModel.name;
    self.timeLabel.text = cTbModel.time;
    self.commentLabel.text = cTbModel.comment;
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    self.indexLabel.text = [NSString stringWithFormat:@"%lu",indexPath.row];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
