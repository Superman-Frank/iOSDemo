//
//  GetFirstLetters.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/12.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetFirstLetters : NSObject
+(NSString *)getFirstLetterFromString:(NSString *)aString;

+(NSMutableArray *)getFirstLetterFromStringArray:(NSArray *)arrays;
@end

NS_ASSUME_NONNULL_END
