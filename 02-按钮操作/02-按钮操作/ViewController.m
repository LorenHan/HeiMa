//
//  ViewController.m
//  02-按钮操作
//
//  Created by 韩 晓剑 on 15/11/14.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

enum{
    keyMovingTop,
    keyMovingBottom,
    keyMovingLeft,
    keyMovingRight,
    keyZoomPlus,
    keyZoomMinus,
    keyRotateLeft,
    keyRotateRight,
};

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置图片按钮位置
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    //设置图片背景
    [btn setBackgroundImage:[UIImage imageNamed:@"left_disable.png"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn02.png"] forState:UIControlStateHighlighted];
    
    //设置背景颜色
    [btn setBackgroundColor:[UIColor greenColor]];
    
    //设置文字
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitle:@"被摸了" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:btn];
    
    self.iconButton = btn;
}

- (IBAction)iconMove:(UIButton *)button{
    CGFloat tx = 0,ty = 0;
    switch (button.tag) {
        case keyMovingTop:
            ty -= 20;
            break;
        case keyMovingBottom:
            ty += 20;
            break;
        case keyMovingLeft:
            tx -= 20;
            break;
        case keyMovingRight:
            tx += 20;
            break;
        default:
            break;
    }
    
    //设置位置  动画效果
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:2.0f];
    self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, tx, ty);
    [UIView commitAnimations];
}

- (IBAction)zoom:(UIButton *)button{
    CGFloat scale = (button.tag == keyZoomPlus) ? 1.2 : 0.8;
    
    [UIView beginAnimations:nil context:nil];
    self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, scale, scale);
    [UIView commitAnimations];
}

- (IBAction)rotate:(UIButton *)button{
    CGFloat angle = (button.tag == keyRotateLeft) ? -M_PI_4 :M_PI_4;
    
    [UIView beginAnimations:nil context:nil];
    self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, angle) ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
