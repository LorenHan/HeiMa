//
//  ViewController.m
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/2.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"

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
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"]];
        
        //创建一个临时数组
        NSMutableArray *arrayM = [NSMutableArray array];
        //遍历数组，一次转换模型
        for (NSDictionary *dict in array) {
            AppInfo *appInfo = [[AppInfo alloc] init];
            appInfo.name = dict[@"name"];
            appInfo.icon = dict[@"icon"];
            
            [arrayM addObject:appInfo];
        }
        
        //将临时数组为属性赋值
        _appList = arrayM;
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
    for (int i = 0; i < 12; i++) {
        //行 用整除/算
        int row = i / kColCount;
        //列 用模%算
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + row * (marginY + kAppViewH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];

        [self.view addSubview:appView];
        
        //实现内部细节
        
        AppInfo *appInfo = self.appList[i];
        //1> UIImageView 照片
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAppViewW, 50)];
        //设置图像
        icon.image = [UIImage imageNamed:appInfo.icon];
        //icon.image = [UIImage imageNamed:@"icon_00"];
        //设置图像填充模式，等比例显示  Ctrl+6 代码索引快捷键
        icon.contentMode = UIViewContentModeScaleAspectFit;
        
        [appView addSubview:icon];
        
        //2> UILabel     应用名称
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame), kAppViewW, 20)];
        label.text = appInfo.name;
        //设置字体
        label.font = [UIFont systemFontOfSize:13.0];
        //设置字居中
        label.textAlignment = NSTextAlignmentCenter;
        
        [appView addSubview:label];
        
        //3> UIButton    下载按钮
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), kAppViewW, 20)];
        
        //背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        //显示文字  需要注意的是设置字的时候也需要normal或者highlighted模式
        [button setTitle:@"下载" forState:UIControlStateNormal];
        //[button setTitle:@"下载" forState:UIControlStateHighlighted];
        
        [appView addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



















