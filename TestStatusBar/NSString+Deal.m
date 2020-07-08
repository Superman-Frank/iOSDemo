//
//  NSString+Deal.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/1.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "NSString+Deal.h"

@implementation NSString (Deal)
-(NSString *)URLDecode;{
    NSString * urlString = self;
    if ([self isVoidString:urlString]) {
        urlString = @"";
    }
    if (![urlString stringByRemovingPercentEncoding]) {
        return urlString;
    }
    return [urlString stringByRemovingPercentEncoding];
}
-(NSString *)URLEncode;{
    NSString * urlStr = self;
    if ([self isVoidString:urlStr]) {
        return @"";
    }
    return [urlStr urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
}
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;{
    NSString * urlStr = self;
    if ([self isVoidString:urlStr]) {
        urlStr = @"";
    }
    NSMutableCharacterSet * charset = [[NSCharacterSet URLQueryAllowedCharacterSet]mutableCopy];
    [charset removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
    NSString * encodeValue = [self stringByAddingPercentEncodingWithAllowedCharacters:charset];
    return encodeValue;
}
//判断是否为空字符串
-(BOOL)isVoidString:(NSString *)str{


    NSCharacterSet * set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * trimmedStr = [str stringByTrimmingCharactersInSet:set];
    
    if (!str || [str isKindOfClass:[NSNull class]] || !str.length || str == nil || str == NULL || [str isEqualToString:@"NULL"] ||[str isEqualToString:@"nil"] || !trimmedStr.length) {
        return YES;
    }
    
    return NO;
    
}
@end
