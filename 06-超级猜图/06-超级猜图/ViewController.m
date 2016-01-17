//
//  ViewController.m
//  06-超级猜图
//
//  Created by 韩 晓剑 on 16/1/14.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (nonatomic, strong) UIButton *cover;

@end

@implementation ViewController

/**
 *  蒙板的懒加载
 *
 *  @return _cover
 */
- (UIButton *)cover {
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        //设置蒙板颜色和透明度 第一个参数0为黑色，越大颜色越浅  第二个参数数值越大透明度越低
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:_cover];
        _cover.alpha = 0.0;
        
        [_cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cover;
}
/** 调整状态栏颜色 */
/**
 UIStatusBarStyleDefault      黑色状态栏
 UIStatusBarStyleLightContent 亮色状态栏
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 *  大小图切换
 */
- (IBAction)bigImage {
    if (self.cover.alpha == 0.0) {
        //将图像按钮弄到最前面
        [self.view bringSubviewToFront:self.iconButton];
        
        //放大图像按钮
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat y = (self.view.bounds.size.height - h) * 0.5;
        
        [UIView animateWithDuration:1.0f animations:^{
            self.iconButton.frame = CGRectMake(0, y, w, h);
            self.cover.alpha = 1.0;
        }];
    } else {
        //动画一旦定义，马上开始
        [UIView animateWithDuration:1.0 animations:^{
            //将动画放回初始位置
            self.iconButton.frame = CGRectMake(85, 113, 150, 150);
            //蒙板逐渐变透明
            self.cover.alpha = 0.0;
        }];
    }

}

@end






































