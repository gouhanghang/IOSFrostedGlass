//
//  ObjectCell.h
//  GH_FrostedGlass
//
//  Created by 苟应航 on 2018/3/26.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHFrostedView.h"

@interface ObjectCell : UITableViewCell
-(void)setobject:(id)arr;
@property(nonatomic,assign)NSInteger number;
@property(nonatomic,strong)NSIndexPath *count;
@property(nonatomic,strong)GHFrostedView *backgroundViews;
+(instancetype)WithObjectCell:(UITableView *)tableview;
@end
