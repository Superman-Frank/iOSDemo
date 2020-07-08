//
//  TestModel.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/5/9.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "TestModel.h"
#define Name @"name"
#define Age  @"age"
#define Sex  @"sex"
@implementation TestModel
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:Name];
        self.age = [[coder decodeObjectForKey:Age]longValue];
        self.sex = [coder decodeObjectForKey:Sex];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:Name];
    [coder encodeObject:[NSNumber numberWithInteger:self.age] forKey:Age];
    [coder encodeObject:self.sex forKey:Sex];
    
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@--%ld岁",self.name,self.sex,(long)self.age];
}
@end
