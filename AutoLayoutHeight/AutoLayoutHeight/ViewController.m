//
//  ViewController.m
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/26.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "ViewController.h"
#import "FriendCircleModel.h"
#import "FriendCircleFrameModel.h"
#import "CustomHeaderView.h"
#import "CustomFooterView.h"
#import "CommentCell.h"
#import "Header.h"
#import "MyInfoController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CustomHeaderViewDelegate,CommentCellDelegate>

@property(nonatomic, strong) UITableView *tv;
@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) NSMutableArray *commentDataSource;

@end

@implementation ViewController

- (NSMutableArray *)commentDataSource{
    if(!_commentDataSource){
        _commentDataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _commentDataSource;
}

-(UITableView *)tv{
    if(!_tv){
        _tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tv.delegate = self;
        _tv.dataSource = self;
        [_tv registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tv registerClass:[CustomHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CustomHeaderView class])];
        [_tv registerClass:[CustomFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CustomFooterView class])];
        [_tv registerClass:[CommentCell class] forCellReuseIdentifier:NSStringFromClass([CommentCell class])];
    }
    return _tv;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FriendCircleFrameModel *framemodel = self.dataSource[section];
    CustomHeaderView *headerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CustomHeaderView class])];
    headerview.delegate = self;
    headerview.framemodel = framemodel;;
    return headerview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    FriendCircleFrameModel *framemodel = self.dataSource[section];
    return framemodel.headerviewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CustomFooterView *footerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CustomFooterView class])];
    footerview.contentView.backgroundColor = [UIColor blueColor];
    return footerview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCircleModel *model = self.commentDataSource[indexPath.section];
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentCell class])];
    cell.model = model;
    cell.delegate = self;
    return cell;
}

- (void)refreshTableView:(FriendCircleModel *)model{
    for (FriendCircleFrameModel *framemodel in self.dataSource) {
        if(framemodel.model == model){
            NSUInteger index = [self.dataSource indexOfObject:framemodel];
            FriendCircleFrameModel *selectedmodel = self.dataSource[index];
            selectedmodel.model = model;
        }
    }
    [self.tv reloadData];
}

- (void)enterMeInfo{
    MyInfoController *infovc = [MyInfoController new];
    [self.navigationController pushViewController:infovc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [self creatDataSourceWithCount:10];
    [self.view addSubview:self.tv];
}

- (NSArray *)creatDataSourceWithCount:(NSInteger)count{
    NSArray *iconArr = @[@"icon0.jpg",@"icon1.jpg",@"icon2.jpg",@"icon3.jpg",@"icon4.jpg"];
    NSArray *nameArr = @[@"宇文化及",@"长孙无极",@"成吉思汗",@"宇文成都",@"朱元璋"];
    NSArray *textArr = @[@"属于汉字文化圈的一些国家和民族也有庆贺新春的习俗。",
                         @"百节年为首，春节是中华民族最隆重的传统佳节，它不仅集中体现了中华民族的思想信仰。",
                         @"在不同时代，“正月初一”有不同名称",
                         @"在古代民间，人们从腊月的腊祭或腊月二十三或二十四的祭灶便开始“忙年”了，新年到正月十九日才结束。在现代，人们把春节定于农历正月初一，但一般至少要到农历正月十五（元宵节）新年才算结束。春节是个欢乐祥和的节日，是亲朋好友欢聚的日子，是人们增深感情的纽带。节日交流问候传递着亲朋乡里之间的亲情伦理，它是春节得以持存发展的重要要义。",
                         @"春节，即农历新年，是一年之岁首，传统意义上的“年节”。俗称新春、新岁、新年、新禧、年禧、大年等，口头上又称度岁、庆岁、过年、过大年。春节历史悠久，由上古时代岁首祈年祭祀演变而来。万物本乎天、人本乎祖，祈年祭祀、敬天法祖，报本反始也。春节的起源蕴含着深邃的文化内涵，在传承发展中承载了丰厚的历史文化底蕴。在春节期间，全国各地均有举行各种庆贺新春活动，热闹喜庆气氛洋溢；这些活动以除旧布新、迎禧接福、拜神祭祖、祈求丰年为主要内容，形式丰富多彩，带有浓郁的各地域特色，凝聚着中华文明的文化精华。"
                         ];
    NSArray *commentArr = @[@"@宇文化及:春节，即农历新年，是一年之岁首，传统意义上的“年节”。俗称新春、新岁、新年、新禧、年禧、大年等，口头上又称度岁、庆岁、过年、过大年。",@"@朱元障:节日交流问候传递着亲朋乡里之间的亲情伦理，它是春节得以持存发展的重要要义。",@"朱元障:在不同时代，“正月初一”有不同名称",@"@长孙无极:百节年为首，春节是中华民族最隆重的传统佳节",@"@成吉思汗:属于汉字文化圈的一些国家和民族也有庆贺新春的习俗。"];
//    NSArray *imageArr = @[ @"100.jpg",@"101.jpg",@"102.jpg",@"103.jpg",@"104.jpg",@"105.jpg",@"106.jpg",@"107.jpg",@"108.jpg"];
    NSMutableArray *resArr = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int commentRandomIndex = arc4random_uniform(5);
        FriendCircleModel *model = [FriendCircleModel new];
        model.iconStr = iconArr[iconRandomIndex];
        model.nameStr = nameArr[nameRandomIndex];
        model.contentStr = textArr[contentRandomIndex];
        model.detailStr = @"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        model.commentStr = commentArr[commentRandomIndex];
        model.allOrPart = NO;
        [self.commentDataSource addObject:model];
//        int randomPic = arc4random_uniform(9)+1;
//        NSMutableArray *temp = [NSMutableArray new];
//        for (int i = 0; i < randomPic; i++) {
//            int randomIndex = arc4random_uniform(9);
//            [temp addObject:imageArr[randomIndex]];
//        }
//        if (temp.count) {
//            model.imageArr = [temp copy];
//        }
        FriendCircleFrameModel *frameModel = [[FriendCircleFrameModel alloc]init];
        frameModel.model = model;
        [resArr addObject:frameModel];
    }
    return [resArr copy];
}

@end
