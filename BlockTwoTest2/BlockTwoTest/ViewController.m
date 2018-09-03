//
//  ViewController.m
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//1.代理就像发言人，发言人可以为我执行一系列事情
//2. 1V1


#import "ViewController.h"

#import "BlockTestInstance.h"

#import "NextViewController.h"

@interface ViewController ()<ThisDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [BlockTestInstance instance].delegate = self;
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    [btn setTitle:[NSStringFromClass([self class]) stringByAppendingString:@"btn"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction {
    
    [self presentViewController:[NextViewController new] animated:YES completion:nil];
}

- (void)delegateAction;{
    
    NSLog(@"%@", NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
