//
//  Student.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "Student.h"

@implementation Student
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
        @"ID" : @"id",
        @"desc" : @"description",
        @"oldName" : @"name.oldName",
        @"nowName" : @"name.newName",
        @"nameChangedTime" : @"name.info[1].nameChangedTime",
        @"bag" : @"other.bag"
    };
}
@end

@implementation Bag


@end
