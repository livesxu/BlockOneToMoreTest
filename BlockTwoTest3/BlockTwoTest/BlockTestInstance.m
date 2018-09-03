//
//  BlockTestInstance.m
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import "BlockTestInstance.h"

@implementation BlockTestInstance

+ (instancetype)instance {
    
    static BlockTestInstance *Instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        Instance = [[BlockTestInstance alloc] init];
        
        [Instance performSelector:@selector(fireAction) withObject:nil afterDelay:5];
    });
    return Instance;
}

- (NSMutableArray *)delegateArray {
    
    if (!_delegateArray) {
        
        _delegateArray = [NSMutableArray array];
    }
    return _delegateArray;
}

- (NSMutableArray<OneBlock> *)oneBlockArray {
    
    if (!_oneBlockArray) {
        
        _oneBlockArray = [NSMutableArray array];
    }
    return _oneBlockArray;
}

//触发事件
- (void)fireAction {
    
//    //这样的化delloc是不会走的，这样要销毁需要跟业务相关是否可提起remove
//    for (id <ThisDelegate>dele in self.delegateArray) {
//
//        if ([dele respondsToSelector:@selector(delegateAction)]) {
//
//            [dele delegateAction];
//        }
//    }
    
    //delloc是可以走的，但是应该在delloc的时候适当移除
    for (OneBlock oneBlock in self.oneBlockArray) {
        
        oneBlock();
    }
    
    [self performSelector:@selector(fireAction) withObject:nil afterDelay:5];
}


@end
