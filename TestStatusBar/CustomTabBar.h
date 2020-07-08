//
//  CustomTabBar.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/16.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTabBar : UITabBar
@property (nonatomic,copy)void (^ centerClickBlock)(void);
@property (nonatomic,copy)void (^ centerLongClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
