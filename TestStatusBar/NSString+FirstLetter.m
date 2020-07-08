//
//  NSString+FirstLetter.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/12.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)
+(NSString *)getFirstLetterFromString:(NSString *)aString;
{
    //转成了可变字符串
    NSMutableString * str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    //在转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    //转化为大写拼音
    NSString * strPinYin = [str capitalizedString];
    //获取并返回首字母
    return [strPinYin substringToIndex:1];
}
@end
