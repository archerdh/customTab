//
//  ViewController.m
//  customTab
//
//  Created by zheng zhang on 2017/9/21.
//  Copyright © 2017年 starRank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(( arc4random() % 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
