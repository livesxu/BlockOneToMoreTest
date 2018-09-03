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

//触发事件
- (void)fireAction {
    
    if (self.oneBlock) {
        
        self.oneBlock();
    }
    
    [self performSelector:@selector(fireAction) withObject:nil afterDelay:5];
}


@end
