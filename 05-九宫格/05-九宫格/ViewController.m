//
//  ViewController.m
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/2.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

#define kAppViewW 80
#define kAppViewH 90
#define kColCount 3
#define kStartY   20

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //x轴间隔 列间隔
    CGFloat marginX = (self.view.bounds.size.width - kAppViewW * kColCount) / (kColCount + 1);
    //y轴间隔 行间隔
    CGFloat marginY = 10;
    
    for (int i = 0; i < 12; i++) {
        //行 用整除/算
        int row = i / kColCount;
        //列 用模%算
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + row * (marginY + kAppViewH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];
        appView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:appView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
