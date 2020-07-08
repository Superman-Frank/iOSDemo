//
//  Player.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/27.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tematemates.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * number;
@property (nonatomic,copy)NSString * State;
@property (nonatomic,copy)NSString * nickName;
@property (nonatomic,copy)NSString * speed_name;
@property (nonatomic,copy)NSArray<Tematemates *> *temates;
@end


NS_ASSUME_NONNULL_END
