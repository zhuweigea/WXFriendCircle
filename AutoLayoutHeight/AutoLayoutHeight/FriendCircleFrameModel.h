//
//  FriendCircleFrameModel.h
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FriendCircleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendCircleFrameModel : NSObject

@property(nonatomic, strong) FriendCircleModel *model;
@property(nonatomic, assign) CGRect iconFrame;
@property(nonatomic, assign) CGRect nameFrame;
@property(nonatomic, assign) CGRect allOrPartFrame;
@property(nonatomic, assign) CGRect contentFrame;
@property(nonatomic, assign) CGRect detailFrame;
@property(nonatomic, assign) CGFloat headerviewHeight;

@end

NS_ASSUME_NONNULL_END
