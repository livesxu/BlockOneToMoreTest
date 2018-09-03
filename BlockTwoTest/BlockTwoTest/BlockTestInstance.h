//
//  BlockTestInstance.h
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OneBlock)(void);

@interface BlockTestInstance : NSObject

@property (nonatomic, strong) OneBlock oneBlock;

+ (instancetype)instance;

@end
