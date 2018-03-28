//
//  ViewController.m
//  GH_FrostedGlass
//
//  Created by 苟应航 on 2018/3/26.
//  Copyright © 2018年 GouHang. All rights reserved.
//
#import "ObjectModel.h"
#import "ViewController.h"
#import "ObjectCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *frostedglassarr;
@end

@implementation ViewController
-(UITableView *)tableview{
    if (_tableview==nil) {
        _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableview.showsVerticalScrollIndicator=NO;
        _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableview.dataSource=self;
        _tableview.delegate=self;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _frostedglassarr=@[].mutableCopy;
    [self tableview];
    [self loadJson];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _frostedglassarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ObjectCell *cell=[ObjectCell WithObjectCell:tableView];
    NSInteger number=indexPath.row;
    cell.number=number;
//    cell.backgroundViews.image=[UIImage imageNamed:number==0?@"DBS":number==1?@"ZLSA":@"MFLS"];
    [cell setobject:_frostedglassarr[indexPath.row]];
    _tableview.rowHeight=200;
    return cell;
}
-(void)loadJson{
 
    NSArray *jsonarr=@[
                     @{
                         @"object":@[
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522124228629&di=b925c778df0a786c40ac9b9e2e9cc40e&imgtype=0&src=http%3A%2F%2Fimg.pc841.com%2F2016%2F1202%2F20161202092612786.jpg",
                                     @"titlestr":@"我是IOS"
                                   },
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522719027&di=c045bb2ed9a18fef9b987451d645c440&imgtype=jpg&er=1&src=http%3A%2F%2Fupload.chinaz.com%2F2015%2F0916%2F1442366570369.jpg",
                                     @"titlestr":@"我是Android"
                                     },
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522124313763&di=eb9fbf521d65602eeb61d45fe9025f04&imgtype=0&src=http%3A%2F%2Ftech.southcn.com%2Ft%2Fimages%2Fattachement%2Fjpg%2Fsite4%2F20151125%2F14%2F10709670392001746614.jpg",
                                     @"titlestr":@"我是web"
                                     },
                                 ]
                       },
                     @{
                         @"show":@[
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522719027&di=c045bb2ed9a18fef9b987451d645c440&imgtype=jpg&er=1&src=http%3A%2F%2Fupload.chinaz.com%2F2015%2F0916%2F1442366570369.jpg",
                                     @"titlestr":@"我是Android"
                                     },
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522124228629&di=b925c778df0a786c40ac9b9e2e9cc40e&imgtype=0&src=http%3A%2F%2Fimg.pc841.com%2F2016%2F1202%2F20161202092612786.jpg",
                                     @"titlestr":@"我是IOS"
                                     }
                                 ]
                         },
                     @{
                         @"party":@[
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522124313763&di=eb9fbf521d65602eeb61d45fe9025f04&imgtype=0&src=http%3A%2F%2Ftech.southcn.com%2Ft%2Fimages%2Fattachement%2Fjpg%2Fsite4%2F20151125%2F14%2F10709670392001746614.jpg",
                                     @"titlestr":@"我是web"
                                     },
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522124228629&di=b925c778df0a786c40ac9b9e2e9cc40e&imgtype=0&src=http%3A%2F%2Fimg.pc841.com%2F2016%2F1202%2F20161202092612786.jpg",
                                     @"titlestr":@"我是IOS"
                                     },
                                 @{
                                     @"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522719027&di=c045bb2ed9a18fef9b987451d645c440&imgtype=jpg&er=1&src=http%3A%2F%2Fupload.chinaz.com%2F2015%2F0916%2F1442366570369.jpg",
                                     @"titlestr":@"我是Android"
                                     },
                               
                                 ]
                         },
                        ];

    NSMutableArray *mutableobjectarr=[NSMutableArray array];
    NSMutableArray *mutableshowarr=[NSMutableArray array];
    NSMutableArray *mutablepartyarr=[NSMutableArray array];
    for (NSDictionary *dic in jsonarr) {
        NSArray *arrobject = dic[@"object"];
        NSArray *arrshow = dic[@"show"];
        NSArray *arrparty = dic[@"party"];
        for (NSDictionary *dic in arrobject) {
            ObjectModel *model=[ObjectModel mj_objectWithKeyValues:dic];
            [mutableobjectarr addObject:model];
        }
        for (NSDictionary *dic in arrshow) {
            ObjectModel *model=[ObjectModel mj_objectWithKeyValues:dic];
            [mutableshowarr addObject:model];
        }
        for (NSDictionary *dic in arrparty) {
            ObjectModel *model=[ObjectModel mj_objectWithKeyValues:dic];
            [mutablepartyarr addObject:model];
        }
        
    }
    [_frostedglassarr addObject:mutableobjectarr];
    [_frostedglassarr addObject:mutableshowarr];
    [_frostedglassarr addObject:mutablepartyarr];
    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
