//
//  Tabbar.h
//  customTab
//
//  Created by zheng zhang on 2017/9/21.
//  Copyright © 2017年 starRank. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TabbarClickBlock)();

@interface Tabbar : UITabBar

@property (copy, nonatomic) TabbarClickBlock btnBlock;

@end
