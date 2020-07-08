//
//  Persons.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/2.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger  {
    PlayerTypePG = 10,
    PlayerTypeSG = 20,
    PlayerTypeSF = 30,
    PlayerTypePF = 40,
    PlayerTypeC = 50,
} PlayerType;
@interface Persons : NSObject
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSNumber * number;
@property (nonatomic,assign)PlayerType  playerType;

-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(instancetype)personsWithDictionary:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
