//
//  CustomHeaderView.m
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "CustomHeaderView.h"
#import "Header.h"
#import "FriendCircleModel.h"

@implementation CustomHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.icon = [UIImageView new];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 20;
    [self.contentView addSubview:self.icon];
    self.name = [UILabel new];
    self.name.textColor = [UIColor blackColor];
    self.name.font = [UIFont systemFontOfSize:16];
    self.name.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.name];
    self.content = [UILabel new];
    self.content.numberOfLines = 0;
    self.content.textColor = [UIColor blackColor];
    self.content.font = [UIFont systemFontOfSize:16];
    self.content.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.content];
    self.allOrPartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.allOrPartBtn setTitle:@"全部" forState:UIControlStateNormal];
    [self.allOrPartBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.allOrPartBtn setBackgroundColor:[UIColor orangeColor]];
    self.allOrPartBtn.layer.masksToBounds = YES;
    self.allOrPartBtn.layer.cornerRadius = 15;
    [self.allOrPartBtn addTarget:self action:@selector(allOrPart:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.allOrPartBtn];
    self.details = [UILabel new];
    self.details.numberOfLines = 0;
    self.details.textColor = [UIColor blackColor];
    self.details.font = [UIFont systemFontOfSize:16];
    self.details.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.details];
}

- (void)setFramemodel:(FriendCircleFrameModel *)framemodel{
    _framemodel = framemodel;
    FriendCircleModel *model = framemodel.model;
    
    self.icon.image = [UIImage imageNamed:model.iconStr];
    self.icon.frame = framemodel.iconFrame;
    
    self.name.text = model.nameStr;
    self.name.frame = framemodel.nameFrame;
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    style.firstLineHeadIndent = 20;
    NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:model.contentStr];
    [abs addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, model.contentStr.length)];
    self.content.attributedText = abs;
    self.content.frame = framemodel.contentFrame;
    
    if(model.allOrPart){
        [self.allOrPartBtn setTitle:@"展开" forState:UIControlStateNormal];
    }else{
        [self.allOrPartBtn setTitle:@"全部" forState:UIControlStateNormal];
    }
    self.allOrPartBtn.frame = framemodel.allOrPartFrame;
    
    self.details.text = model.detailStr;
    self.details.frame = framemodel.detailFrame;
}

- (void)allOrPart:(UIButton *)sender{
    FriendCircleModel *model = _framemodel.model;
    model.allOrPart = !model.allOrPart;
    if(model.allOrPart){
        [sender setTitle:@"展开" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"全部" forState:UIControlStateNormal];
    }
    if(self.delegate&&[self.delegate respondsToSelector:@selector(refreshTableView:)]){
        [self.delegate refreshTableView:model];
    }
}

@end
