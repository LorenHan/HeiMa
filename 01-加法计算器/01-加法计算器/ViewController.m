//
//  ViewController.m
//  01-加法计算器
//
//  Created by 韩 晓剑 on 15/11/11.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (IBAction)calculate {
    //1.get textfield value
    NSString *n1 = self.num1.text;
    NSString *n2 = self.num2.text;
    
    //2.n1 + n2
    int sum = n1.intValue + n2.intValue;
    
    //3.show sum in label
    self.result.text = [NSString stringWithFormat:@"%d",sum];
    
    
    //close keyboard
    //method 1
    //[self.num1 resignFirstResponder];
    //[self.num2 resignFirstResponder];
    
    //method 2
    //YES: force close keyboard
    [self.view endEditing:YES];
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
