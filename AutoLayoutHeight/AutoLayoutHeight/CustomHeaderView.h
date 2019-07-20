//
//  CustomHeaderView.h
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendCircleFrameModel.h"
#import "FriendCircleModel.h"

@class CustomHeaderView;
@class FriendCircleModel;

@protocol CustomHeaderViewDelegate <NSObject>

- (void)refreshTableView:(FriendCircleModel *_Nullable)model;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CustomHeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong) FriendCircleFrameModel *framemodel;
@property(nonatomic, strong) UIImageView *icon;
@property(nonatomic, strong) UILabel *name;
@property(nonatomic, strong) UILabel *content;
@property(nonatomic, strong) UIButton *allOrPartBtn;
@property(nonatomic, strong) UILabel *details;

@property(nonatomic, weak) id<CustomHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
