//
//  NSString+Deal.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/1.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Deal)
-(NSString *)URLDecode;
-(NSString *)URLEncode;
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
@end

NS_ASSUME_NONNULL_END
