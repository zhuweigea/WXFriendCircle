# WXFriendCircle


可以在FriendCircleFrameModel(根据model计算frame)中设置内容的行间距和首行缩进,注意设置行间距和首行缩进也需要   CustomHeaderView(组头视图中设置NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
style.lineSpacing = 5;
style.firstLineHeadIndent = 20;
NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:model.contentStr];
[abs addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, model.contentStr.length)];
self.content.attributedText = abs;)
