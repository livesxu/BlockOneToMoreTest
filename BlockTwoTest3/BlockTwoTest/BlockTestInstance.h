//
//  BlockTestInstance.h
//  BlockTwoTest
//
//  Created by livesxu on 2018/9/3.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ThisDelegate <NSObject>

- (void)delegateAction;

@end

typedef void(^OneBlock)(void);

@interface BlockTestInstance : NSObject

@property (nonatomic, assign) id<ThisDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *delegateArray;

//@property (nonatomic, strong) OneBlock oneBlock;
@property (nonatomic, strong) NSMutableArray <OneBlock>*oneBlockArray;//数组只是一个例子，正式上应该用字典好一点。

+ (instancetype)instance;

@end
