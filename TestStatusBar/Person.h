//
//  Person.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "Header.h"
#import "User.h"
#import "RetweetedStatus.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSNumber * money;
@property (nonatomic,assign)unsigned int age;
@property (nonatomic,strong)User * user;
@property (nonatomic,assign)SexType sex;
@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * text;
@property (nonatomic,strong)RetweetedStatus * retweetedStatus;

@end

@interface Dog : NSObject


@end

NS_ASSUME_NONNULL_END
