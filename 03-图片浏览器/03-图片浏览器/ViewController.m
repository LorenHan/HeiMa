//
//  ViewController.m
//  03-图片浏览器
//
//  Created by 韩 晓剑 on 15/11/14.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"
/*
 纯代码创建项目步骤
 
 1. 确定界面元素
 2. 编写代码创建界面元素
 3. 方法实现
 4. 代码重构
 5. 测试
**/
@interface ViewController ()

@property (nonatomic,strong) UILabel *noLabel;   //显示顶部图片号
@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UISlider *iconSlider;
@property (nonatomic,strong) UISwitch *iconSwitch;


/*图片索引*/
@property (nonatomic,assign) NSInteger imageIndex;
/*图片信息表*/
@property (nonatomic,strong) NSArray *imageList;
@end

@implementation ViewController

- (NSArray *)imageList{
    
    return _imageList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //序号标签
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.noLabel];
    
    //图像显示
    CGFloat imageW = self.view.bounds.size.width - 120;
    CGFloat imageH = imageW + 20;
    CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5; //60
    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20; //得到一个控件的最大Y值
    
    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    self.iconImage.backgroundColor = [UIColor blueColor];//不能写到alloc前面去，需要先分配空间。
    self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
    [self.view addSubview:self.iconImage];
    
    //左右箭头
    CGFloat arrowW = 40;
    CGFloat arrowH = 40;
    CGFloat arrowLeftButtonX = 10;
    CGFloat arrowRightButtonX  = 70 + imageW;
    CGFloat arrowY = imageH * 0.5 + CGRectGetMaxY(self.noLabel.frame);
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(arrowLeftButtonX, arrowY,arrowW , arrowH)];
    //self.leftButton.backgroundColor = [UIColor greenColor];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal.png"] forState:UIControlStateNormal];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted.png"] forState:
        UIControlStateHighlighted];
    [self.view addSubview:self.leftButton];
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(arrowRightButtonX, arrowY,arrowW , arrowH)];
    //self.rightButton.backgroundColor = [UIColor greenColor];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal.png"] forState:UIControlStateNormal];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.rightButton];
    
    //下面的标题栏
    CGFloat descLabelX = 60 + imageW * 0.125;
    CGFloat descLabelY = 5 + CGRectGetMaxY(self.iconImage.frame);
    CGFloat descLabelW = imageW * 0.75;
    CGFloat descLabelH = 40;
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(descLabelX, descLabelY, descLabelW, descLabelH)];
    self.descLabel.text = @"神马表情";
    //self.descLabel.backgroundColor = [UIColor yellowColor];
    self.descLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.descLabel];
    
    //滑动按钮 
    
    //夜间模式
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


































