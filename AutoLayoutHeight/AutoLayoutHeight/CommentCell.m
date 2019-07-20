//
//  CommentCell.m
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/5/4.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "CommentCell.h"
#import "Header.h"
#import <Masonry.h>
#import "UILabel+YBAttributeTextTapAction.h"

@interface CommentCell ()<TTTAttributedLabelDelegate>

@end

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.commentLabel = [TTTAttributedLabel new];
    self.commentLabel.numberOfLines = 0;
    self.commentLabel.textColor = [UIColor blackColor];
    self.commentLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.commentLabel];
}

- (void)setModel:(FriendCircleModel *)model{
    _model = model;
    NSArray *array = [model.commentStr componentsSeparatedByString:@":"];
    NSString *nameStr = array[0];
    self.commentLabel.text = model.commentStr;
    self.commentLabel.delegate = self;
    WeakSelf;
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(70);
        make.top.equalTo(weakSelf.contentView);
        make.width.mas_equalTo(SCREEN_WIDTH-85);
        make.bottom.equalTo(weakSelf.contentView);
    }];
    //此属性可以不显示下划线，点击的颜色默认为红色
    self.commentLabel.linkAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithBool:NO],(NSString *)kCTUnderlineStyleAttributeName,nil];
    //设置需要点击的文字的颜色大小
    [self.commentLabel setText:model.commentStr afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        //得到需要点击的文字的位置
        NSRange selRange=[model.commentStr rangeOfString:nameStr];
        
        //设定可点击文字的的大小
        UIFont *selFont=[UIFont systemFontOfSize:17];
        CTFontRef selFontRef = CTFontCreateWithName((__bridge CFStringRef)selFont.fontName, selFont.pointSize, NULL);
        
        //设置可点击文本的大小
        [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)selFontRef range:selRange];
        
        //设置可点击文本的颜色
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor blueColor] CGColor] range:selRange];
        
        CFRelease(selFontRef);
        return mutableAttributedString;
    }];
    NSRange selRange=[model.commentStr rangeOfString:nameStr];
    [self.commentLabel addLinkToTransitInformation:@{@"select":nameStr} withRange:selRange];
}

//#pragma mark - YBAttributeTapActionDelegate
//- (void)yb_tapAttributeInLabel:(UILabel *)label string:(NSString *)string range:(NSRange)range index:(NSInteger)index
//{
//    if(self.delegate&&[self.delegate respondsToSelector:@selector(enterMeInfo)]){
//        [self.delegate enterMeInfo];
//    }
//}

#pragma TTTAttributedLabel Delegate
//文字的点击事件
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTransitInformation:(NSDictionary *)components {
    if(self.delegate&&[self.delegate respondsToSelector:@selector(enterMeInfo)]){
        [self.delegate enterMeInfo];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
