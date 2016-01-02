//
//  ViewController.m
//  04-TomCat
//
//  Created by 韩 晓剑 on 15/12/11.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController
- (IBAction)tomAction:(UIButton *)sender {
    //如果正在动画，直接退出
    if([self.tom isAnimating]) return;
    
    //动画图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //添加动画播放的图片
    for (int i = 0; i < sender.tag; i++) {
        //图像名称 %02d这里要注意
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",sender.currentTitle,i];
        //imageWithContentsOfFile需要全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
    }
    //设置动画数组
    self.tom.animationImages = arrayM;
    //重复一次
    self.tom.animationRepeatCount = 1;
    //动画时长
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;
    //开始动画
    [self.tom startAnimating];
    //动画结束后清理数组
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
