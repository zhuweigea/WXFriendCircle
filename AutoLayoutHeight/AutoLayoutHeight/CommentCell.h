//
//  CommentCell.h
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/5/4.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendCircleModel.h"
#import <TTTAttributedLabel.h>

@protocol CommentCellDelegate <NSObject>

- (void)enterMeInfo;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : UITableViewCell

@property(nonatomic, strong) TTTAttributedLabel *commentLabel;
@property(nonatomic, strong) FriendCircleModel *model;
@property(nonatomic, strong) id<CommentCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
