//
//  ViewController.m
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//1.代理实现的1V多可能会导致循环引用，目前我没想到什么好的方法处理。
//2. block来实现1V多比较好理解一些，而且应用起来也比较直接
//3.1V多还是通知好用，只要提前注册接收就好了。


#import "ViewController.h"

#import "BlockTestInstance.h"

#import "NextViewController.h"

@interface ViewController ()<ThisDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[BlockTestInstance instance].delegateArray addObject:self];
    
    __weak typeof(self) weakSelf = self;
    OneBlock block = ^(){
        
        NSLog(@"%@", NSStringFromClass([weakSelf class]));
    };
    
    [[BlockTestInstance instance].oneBlockArray addObject:block];
    
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
