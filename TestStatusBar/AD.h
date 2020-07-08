//
//  AD.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN

@interface AD : NSObject
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *url;
@end

@interface StatusResult : NSObject
@property (strong, nonatomic) NSMutableArray *statuses;
/** Contatins ad model */
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;
@end

NS_ASSUME_NONNULL_END
