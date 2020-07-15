//
//  UIImage+ZKMask.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/15.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZKMask)
- (UIImage *)maskImage:(UIColor *)maskColor;
@end

NS_ASSUME_NONNULL_END
