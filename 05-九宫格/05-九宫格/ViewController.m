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
        
        AppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
        appView.frame = CGRectMake(x, y, kAppViewW, kAppViewH);
        
        [self.view addSubview:appView];
        
        //实现内部细节
        
        AppInfo *appInfo = self.appList[i];
        //1> UIImageView 照片
        //设置图像
        appView.icon.image = [UIImage imageNamed:appInfo.icon];
        
        //2> UILabel     应用名称
        appView.label.text = appInfo.name;
        
        //3> UIButton    下载按钮
        //给按钮添加监听方法
        appView.button.tag = i;
        
        [appView.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [appView addSubview:appView.button];
    }
}

/**
 *  按钮监听方法
 *
 *  @param button
 */
- (void)click:(UIButton *)button{
    // 取出按钮
    AppInfo *appInfo = self.appList[button.tag];
    //添加一个UILabel到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width- 160)/2, self.view.frame.size.height - 240, 160, 40)];
    //数值0表示黑色，1表示纯白
    //alpha表示透明度 数值越大说明透明度越低
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    label.text = appInfo.name;
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    
    //动画效果
    //收尾式动画，修改对象的属性，frame. bounds. alpha
    //初始化透明度 完全透明
    label.alpha = 0.0;
    
    //禁用按钮
    button.enabled = NO;
    //动画结束后删除
    //^表示block，块代码，是一个预先准备好的代码块，可以当做参数传递在需要的时候执行。
    [UIView animateWithDuration:1.0f animations:^{
        NSLog(@"动画开始");
        label.alpha = 1.0;
    }completion:^(BOOL finished){
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0.0;
        }completion:^(BOOL finished){
            NSLog(@"动画完成");
            [label removeFromSuperview];
        }];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




















