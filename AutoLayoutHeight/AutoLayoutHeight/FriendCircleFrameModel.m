//
//  FriendCircleFrameModel.m
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "FriendCircleFrameModel.h"
#import "Header.h"

@implementation FriendCircleFrameModel

- (void)setModel:(FriendCircleModel *)model{
    _model = model;
    
    CGFloat iconX = HORMARGIN;
    CGFloat iconY = VERMARGIN;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX = CGRectGetMaxX(self.iconFrame)+HORMARGIN;
    CGFloat nameY = VERMARGIN;
    CGFloat nameW = 250;
    CGFloat nameH = [model.nameStr boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size.height;
    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    style.firstLineHeadIndent = 20;
    NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:model.contentStr];
    [abs addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, model.contentStr.length)];
    CGFloat contentX = CGRectGetMaxX(self.iconFrame)+HORMARGIN;
    CGFloat contentY = CGRectGetMaxY(self.nameFrame)+VERMARGIN;
    CGFloat contentW = SCREEN_WIDTH - CGRectGetWidth(self.iconFrame)-3*HORMARGIN;
    CGFloat contentH = [model.contentStr boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:style,NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    CGFloat height = [UIFont systemFontOfSize:16].lineHeight;
    if (contentH <= height*3+10) {
        if(contentH <= height+5){
            contentH = contentH-5;
        }
        self.contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
        self.allOrPartFrame = CGRectZero;
        CGFloat detailX = CGRectGetMaxX(self.iconFrame)+HORMARGIN;
        CGFloat detailY = CGRectGetMaxY(self.contentFrame)+VERMARGIN;
        CGFloat detailW = CGRectGetWidth(self.contentFrame);
        CGFloat detailH = [model.detailStr boundingRectWithSize:CGSizeMake(detailW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        self.detailFrame = CGRectMake(detailX, detailY, detailW, detailH);
        CGFloat headerviewHeight = VERMARGIN*4+CGRectGetHeight(self.nameFrame)+  CGRectGetHeight(self.contentFrame)+CGRectGetHeight(self.detailFrame);
        self.headerviewHeight = headerviewHeight;
    }else{
        if(model.allOrPart){
            self.contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
            CGFloat allOrPartX = nameX;
            CGFloat allOrPartY = CGRectGetMaxY(self.contentFrame)+VERMARGIN;
            CGFloat allOrPartW = 60;
            CGFloat allOrPartH = 30;
            self.allOrPartFrame = CGRectMake(allOrPartX, allOrPartY, allOrPartW, allOrPartH);
            CGFloat detailX = CGRectGetMaxX(self.iconFrame)+HORMARGIN;
            CGFloat detailY = CGRectGetMaxY(self.allOrPartFrame)+VERMARGIN;
            CGFloat detailW = CGRectGetWidth(self.contentFrame);
            CGFloat detailH = [model.detailStr boundingRectWithSize:CGSizeMake(detailW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            self.detailFrame = CGRectMake(detailX, detailY, detailW, detailH);
            CGFloat headerviewHeight = VERMARGIN*5+CGRectGetHeight(self.nameFrame)+  CGRectGetHeight(self.contentFrame)+CGRectGetHeight(self.allOrPartFrame)+ CGRectGetHeight(self.detailFrame);
            self.headerviewHeight = headerviewHeight;
        }else{
            self.contentFrame = CGRectMake(contentX, contentY, contentW, height*3+15);
            CGFloat allOrPartX = nameX;
            CGFloat allOrPartY = CGRectGetMaxY(self.contentFrame)+VERMARGIN;
            CGFloat allOrPartW = 60;
            CGFloat allOrPartH = 30;
            self.allOrPartFrame = CGRectMake(allOrPartX, allOrPartY, allOrPartW, allOrPartH);
            CGFloat detailX = CGRectGetMaxX(self.iconFrame)+HORMARGIN;
            CGFloat detailY = CGRectGetMaxY(self.allOrPartFrame)+VERMARGIN;
            CGFloat detailW = CGRectGetWidth(self.contentFrame);
            CGFloat detailH = [model.detailStr boundingRectWithSize:CGSizeMake(detailW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            self.detailFrame = CGRectMake(detailX, detailY, detailW, detailH);
            CGFloat headerviewHeight = VERMARGIN*5+CGRectGetHeight(self.nameFrame)+  CGRectGetHeight(self.contentFrame)+CGRectGetHeight(self.allOrPartFrame)+ CGRectGetHeight(self.detailFrame);
            self.headerviewHeight = headerviewHeight;
        }
    }
}

@end
