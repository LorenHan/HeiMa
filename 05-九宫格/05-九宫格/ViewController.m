//
//  ViewController.m
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/2.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppView.h"

#define kAppViewW 80
#define kAppViewH 90
#define kColCount 3
#define kStartY   30

@interface ViewController ()

@property (nonatomic,strong) NSArray *appList;

@end

@implementation ViewController

//懒加载appList
- (NSArray *)appList{
    if (nil == _appList){
        _appList = [AppInfo appList];
    }
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //x轴间隔 列间隔
    CGFloat marginX = (self.view.bounds.size.width - kAppViewW * kColCount) / (kColCount + 1);
    //y轴间隔 行间隔
    CGFloat marginY = 10;
    for (int i = 0; i < self.appList.count; i++) {
        //行 用整除/算
        int row = i / kColCount;
        //列 用模%算
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + row * (marginY + kAppViewH);
        
        //AppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
        //AppView *appView = [AppView appView];
        AppView *appView = [AppView appViewWithAppInfo:self.appList[i]];
        
        appView.frame = CGRectMake(x, y, kAppViewW, kAppViewH);
        
        [self.view addSubview:appView];
        //调用appInfo方法，在setter中设置label和imageView图像
        //appView.appInfo = self.appList[i];

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




















