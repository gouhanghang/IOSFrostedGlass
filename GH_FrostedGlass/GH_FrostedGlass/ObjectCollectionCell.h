//
//  ObjectCollectionCell.h
//  GH_FrostedGlass
//
//  Created by 苟应航 on 2018/3/26.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectModel.h"
@class ObjectModel;
@interface ObjectCollectionCell : UICollectionViewCell
@property(nonatomic,strong)ObjectModel *model;
@end
