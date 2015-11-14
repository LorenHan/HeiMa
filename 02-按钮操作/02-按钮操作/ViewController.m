//
//  ViewController.m
//  02-按钮操作
//
//  Created by 韩 晓剑 on 15/11/14.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

enum{
    kMovingDirTop = 1,
    kMovingDirBottom,
    kMovingDirLeft,
    kMovingDirRight,
    keyPlus,
    keyMinus,
    keyRotateLeft,
    keyRotateRight,
};


#define kMovingDelta 20;

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置按钮位置
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 80, 100, 100)];
//    
//    //设置背景图片
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
//    
//    //设置文字
//    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
//    [btn setTitle:@"被摸了" forState:UIControlStateHighlighted];
//    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    
//    //btn显示内容位置
//    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
//    
//    [self.view addSubview:btn];
    
//    self.iconButton = btn;
}

//- (IBAction)move:(UIButton *)button{
//    CGFloat tx = 0,ty = 0;
//    switch (button.tag) {
//        case kMovingDirTop:
//            ty -= kMovingDelta;
//            break;
//        case kMovingDirBottom:
//            ty += kMovingDelta;
//            break;
//        case kMovingDirLeft:
//            tx -= kMovingDelta;
//            break;
//        case kMovingDirRight:
//            tx -= kMovingDelta;
//            break;
//        default:
//            break;
//    }
//    
//    //动画效果
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0f];
//    self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, tx, ty);
//    [UIView commitAnimations];
//}
//
////放大缩小
//- (IBAction)zoom:(UIButton *)button{
//    CGFloat scale = (button.tag == keyPlus) ? 1.2 : 0.8; //符合条件选前面的
//    //动画效果
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0f];
//    self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, scale, scale);
//    [UIView commitAnimations];
//}
//
////旋转
//- (IBAction)rotate:(UIButton *)button{
//    CGFloat angle = (button.tag == keyRotateLeft) ? -M_PI_4 : M_PI_4; //符合条件选前面的
//    //动画效果
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0f];
//    self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, angle);
//    [UIView commitAnimations];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
