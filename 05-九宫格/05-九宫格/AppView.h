//
//  AppView.h
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/12.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo;

@interface AppView : UIView

//自定义视图中显示的数据来源是数据模型
//使用模型来设置自定义视图的显示
@property (strong,nonatomic) AppInfo *appInfo;

@end
