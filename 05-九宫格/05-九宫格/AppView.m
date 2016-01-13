//
//  AppView.m
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/12.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "AppView.h"
#import "AppInfo.h"

@interface AppView()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation AppView

//利用setter方法设置视图界面的显示
- (void)setAppInfo:(AppInfo *)appInfo{
    _appInfo = appInfo;
    
    self.label.text = appInfo.name;
    self.icon.image = [UIImage imageNamed:appInfo.icon];
}

/**
 *  按钮监听方法
 *
 *  @param button
 */
- (IBAction)click:(UIButton *)button{
   
    //添加一个UILabel到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.superview.frame.size.width- 160)/2, self.superview.frame.size.height - 240, 160, 40)];
    //数值0表示黑色，1表示纯白
    //alpha表示透明度 数值越大说明透明度越低
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    label.text = self.appInfo.name;
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.superview addSubview:label];
    
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
@end
