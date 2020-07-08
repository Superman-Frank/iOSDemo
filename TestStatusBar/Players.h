//
//  Players.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/2.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^getDataSuccessful) (BOOL isSuccess, NSString * passValue,NSDictionary *dic);
@interface Players : NSObject

@property (nonatomic,copy)getDataSuccessful complete;
@end

NS_ASSUME_NONNULL_END
