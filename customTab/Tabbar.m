//
//  Tabbar.m
//  customTab
//
//  Created by zheng zhang on 2017/9/21.
//  Copyright © 2017年 starRank. All rights reserved.
//

#import "Tabbar.h"

@interface Tabbar ()

@property (strong, nonatomic) UIButton *btn;

@end

@implementation Tabbar

- (instancetype)init
{
    if (self = [super init]) {
        [self addSubview:self.btn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    int index = 0;
    
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews) {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        // 计算button的尺寸
        tabBarButton.frame = CGRectMake(index * self.bounds.size.width / 5, self.bounds.origin.y, self.bounds.size.width / 5, self.bounds.size.height);
        
        index++;
        
        if (index == 2) {
            self.btn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
            index++;
        }
    }
}

/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    if (index == 2) {
        self.btn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
        index++;
    }
    else
    {
        
    }
}

//重写hitTest方法，去监听"+"按钮和“添加”标签的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //是的话让“+”按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        CGPoint newPoint = [self convertPoint:point toView:self.btn];
        //点是在“+”按钮身上
        if ( [self.btn pointInside:newPoint withEvent:event]) {
            return self.btn;
        }else{
            //不在“+”按钮身上
            return [super hitTest:point withEvent:event];
        }
    }
    //TabBar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
    else
    {
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - Action
- (void)btnclick
{
    if (self.btnBlock) {
        self.btnBlock();
    }
}

#pragma mark - getter
- (UIButton *)btn
{
    if (!_btn) {
        _btn =({
            UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            newBtn.frame = CGRectMake(0, 0, 64, 64);
            [newBtn setImage:[UIImage imageNamed:@"plus_Last"] forState:UIControlStateNormal];
            [newBtn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
            newBtn;
        });
    }
    return _btn;
}

@end
