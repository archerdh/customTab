//
//  TabViewController.m
//  customTab
//
//  Created by zheng zhang on 2017/9/21.
//  Copyright © 2017年 starRank. All rights reserved.
//

#import "TabViewController.h"
#import "Tabbar.h"
#import "ViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

#pragma mark - systemMethod
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}

- (void)setUpView
{
    Tabbar *tabbar = [[Tabbar alloc]init];
    tabbar.btnBlock = ^{
        NSLog(@"点击了btn");
    };
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    ViewController *hvc = [[ViewController alloc] init];
    [self addChildController:hvc title:@"首页" imageName:@"tab1-heartshow" selectedImageName:@"tab1-heart" navVc:[UINavigationController class]];
    
    ViewController *fvc = [[ViewController alloc] init];
    [self addChildController:fvc title:@"活动" imageName:@"tab2-doctor" selectedImageName:@"tab2-doctorshow" navVc:[UINavigationController class]];
    
    ViewController *MoreVc = [[ViewController alloc] init];
    [self addChildController:MoreVc title:@"更多" imageName:@"tab4-more" selectedImageName:@"tab4-moreshow" navVc:[UINavigationController class]];
    
    ViewController *svc = [[ViewController alloc] init];
    [self addChildController:svc title:@"设置" imageName:@"tab5-file" selectedImageName:@"tab5-fileshow" navVc:[UINavigationController class]];
}

#pragma mark - customMethod
- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }forState:UIControlStateSelected];
    
    UINavigationController* nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

@end
