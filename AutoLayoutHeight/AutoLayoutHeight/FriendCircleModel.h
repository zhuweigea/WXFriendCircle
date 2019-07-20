//
//  FriendCircleModel.h
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendCircleModel : NSObject

@property(nonatomic, copy) NSString *iconStr;
@property(nonatomic, copy) NSString *nameStr;
@property(nonatomic, copy) NSString *contentStr;
@property(nonatomic, copy) NSString *detailStr;
@property(nonatomic, strong) NSString *commentStr;
//用来控制是否完全展示contentStr 默认为no
@property(nonatomic, assign) BOOL allOrPart;
//@property(nonatomic, strong) NSArray *imageArr;

@end

NS_ASSUME_NONNULL_END
