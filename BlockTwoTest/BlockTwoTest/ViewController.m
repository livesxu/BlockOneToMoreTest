//
//  ViewController.m
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//1.block可以理解为预置函数
//2.block是替换的,就像一个人，原先准备10：00开始做这件事，但是又改变主意了去做另一件事，那么原先准备做的那件事就被替换了，之后执行就是另一件事。


#import "ViewController.h"

#import "BlockTestInstance.h"

#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof(self) weakSelf = self;
    [BlockTestInstance instance].oneBlock = ^{
        
        NSLog(@"%@", NSStringFromClass([weakSelf class]));
    };
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    [btn setTitle:[NSStringFromClass([self class]) stringByAppendingString:@"btn"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction {
    
    [self presentViewController:[NextViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
