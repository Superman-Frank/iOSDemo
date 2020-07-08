//
//  AccountManager.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/11.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "AccountManager.h"
static AccountManager *_instance = nil;
@implementation AccountManager
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL]init];
    });
    return _instance;
}

@end
