//
//  AppInfo.m
//  05-九宫格
//
//  Created by 韩 晓剑 on 16/1/4.
//  Copyright © 2016年 韩 晓剑. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

//合成指令，主动指定属性使用的成员变量名称
//@synthesize image = _image;
/**
 使用KVC的注意事项
 
 1> plist中的键值名称必须与模型中的属性一致
 2> 模型中的属性可以不全部出现在plist中
 */
//- (UIImage *)image{
//    if (_image = nil) {
//        <#statements#>
//    }
//}

/** 使用字典实例化模型 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // KVC - key value coding键值编码
        // 是一种间接修改/读取对象属性的一种方法
        // KVC 被称为 cocoa 的大招！
        // 参数：
        // 1. 数值
        // 2. 属性名称
//        [self setValue:dict[@"name"] forKeyPath:@"name"];
//        [self setValue:dict[@"icon"] forKeyPath:@"icon"];
        //setValuesForKeysWithDictionary 本质上就是上面两行代码
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

/**类方法可以快速实例化一个对象*/
+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appList {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    
    //创建一个临时数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //遍历数组，依次转换模型
    for (NSDictionary *dict in array) {
        [arrayM addObject:[AppInfo appInfoWithDict:dict]];
    }
    
    return arrayM;
}


@end
