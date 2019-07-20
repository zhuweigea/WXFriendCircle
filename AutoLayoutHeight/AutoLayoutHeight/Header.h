//
//  Header.h
//  AutoLayoutHeight
//
//  Created by 朱伟阁 on 2019/4/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define HORMARGIN 15
#define VERMARGIN 15
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DT_IS_IPHONEX_XS (SCREEN_HEIGHT == 812.f)//是否是iPhoneX、iPhoneXS
#define DT_IS_IPHONEXR_XSMax (SCREEN_HEIGHT == 896.f)//是否是iPhoneXR、iPhoneX Max
#define IS_IPHONEX_SET (DT_IS_IPHONEX_XS||DT_IS_IPHONEXR_XSMax)//是否是iPhoneX系列手机
#define State_Bar_H ((![[UIApplication sharedApplication] isStatusBarHidden]) ? [[UIApplication sharedApplication] statusBarFrame].size.height : (IS_IPHONEX_SET?44.f:20.f))
#define SafeAreaBottom_H ((IS_IPHONEX_SET) ? 34.f : 0.f)
#define Tab_Bar_H 49.f
#define Nav_Bar_H 44.f
#define WeakSelf __weak typeof(self) weakSelf = self;

#endif /* Header_h */
