//
//  ObjectCollectionCell.m
//  GH_FrostedGlass
//
//  Created by 苟应航 on 2018/3/26.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import "ObjectCollectionCell.h"
@interface ObjectCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *images;
@property (weak, nonatomic) IBOutlet UILabel *labes;
@end
@implementation ObjectCollectionCell
-(void)setModel:(ObjectModel *)model{
    _model=model;
    [_images sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _labes.text=_model.titlestr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor=[UIColor whiteColor];
    self.layer.cornerRadius=10;
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.3f;//阴影透明度，默认0
    self.layer.shadowRadius = 3;
    _images.layer.masksToBounds=YES;
    _images.layer.cornerRadius=35;
    
    // Initialization code
}

@end
