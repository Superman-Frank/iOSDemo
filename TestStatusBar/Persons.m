//
//  Persons.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/2.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "Persons.h"

@implementation Persons

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)personsWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}
@end
