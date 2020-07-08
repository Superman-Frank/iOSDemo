//
//  RetweetedStatus.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface RetweetedStatus : NSObject
@property (nonatomic,strong)User * user;
@property (nonatomic,copy)NSString * text;
@end

NS_ASSUME_NONNULL_END
