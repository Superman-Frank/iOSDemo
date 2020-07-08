//
//  SecondViewController.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SecondPassValueBlock)(NSString *);
@interface SecondViewController : UIViewController
@property (nonatomic,copy)SecondPassValueBlock  block;
@end

NS_ASSUME_NONNULL_END
