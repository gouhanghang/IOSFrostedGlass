//
//  ObjectCell.m
//  GH_FrostedGlass
//
//  Created by 苟应航 on 2018/3/26.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import "ObjectCell.h"

#import "ObjectCollectionCell.h"
@interface ObjectCell()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    int  allx;
    
}
@property(nonatomic,strong)NSMutableArray  *collectarr;
@property(nonatomic,strong)UICollectionView *collevtionview;
@end
@implementation ObjectCell

+(instancetype)WithObjectCell:(UITableView *)tableview{
    NSString *const ID = @"ObjectCellID";
    ObjectCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[ObjectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self LoadObjectUI];
        _collectarr=@[].mutableCopy;
        self.backgroundViews =[[GHFrostedView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        self.backgroundViews.scrollView = _collevtionview;
        self.backgroundViews.isGlassEffectOn = YES;
        self.backgroundViews.originalImage = [UIImage imageNamed:@"DBS"];
        _collevtionview.backgroundView =self.backgroundViews;
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setNumber:(NSInteger)number{
    _number=number;
    self.backgroundViews.image=[UIImage imageNamed:number==0?@"DBS":number==1?@"MFLS":@"ZLSA"];
}
-(void)setobject:(id)arr{
    NSMutableArray *arrone=arr;
    if (arrone!=nil) {
        _collectarr = arrone;
        [self.collevtionview reloadData];
    }
}
-(void)LoadObjectUI{
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    //    //    设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH/2, 60);
    _collevtionview=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 25, SCREEN_WIDTH, 150) collectionViewLayout:layout];
    _collevtionview.backgroundColor=[UIColor whiteColor];
    _collevtionview.showsVerticalScrollIndicator=NO;
    _collevtionview.showsHorizontalScrollIndicator=NO;
    //    _collevtionview.collectionViewLayout=layout;
    _collevtionview.dataSource = self;
    _collevtionview.delegate = self;
    [_collevtionview registerNib:[UINib nibWithNibName:@"ObjectCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ObjectCollectionCell"];
    [_collevtionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader"];
    _collevtionview.showsVerticalScrollIndicator = NO;
    [self.contentView addSubview:_collevtionview];
    [_collevtionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    
    
    
//    [_backgroundViews mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.mas_equalTo(0);
//    }];
    
    
    
}
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _collectarr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH/2, 150);
}

//这个你不知道可以撞墙了.没救了
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ObjectModel *model=_collectarr[indexPath.row];
    ObjectCollectionCell *cell = (ObjectCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ObjectCollectionCell" forIndexPath:indexPath];
    cell.model=model;
    return cell;
    
}
//创建头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *headView  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"UICollectionViewHeader"  forIndexPath:indexPath];
    headView.backgroundColor = [UIColor clearColor];
    return headView;
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (IS_IPHONE_6PLUSH) {
        return CGSizeMake(129, 150);
//    }else{
//        return CGSizeMake(119, 170);
//    }
    
    
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);

}

////设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
