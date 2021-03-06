//
//  NextViewController.m
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import "NextViewController.h"

#import "BlockTestInstance.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)dealloc {
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof(self) weakSelf = self;
    [BlockTestInstance instance].oneBlock = ^{
        
        NSLog(@"%@", NSStringFromClass([weakSelf class]));
    };
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    [btn setTitle:[NSStringFromClass([self class]) stringByAppendingString:@"btn"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
