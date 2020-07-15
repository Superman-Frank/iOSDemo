//
//  UIView+ZKLayout.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/15.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZKLayout)
@property (nonatomic,assign)CGFloat  top;
@property (nonatomic,assign)CGFloat  bottom;
@property (nonatomic,assign)CGFloat  left;
@property (nonatomic,assign)CGFloat  right;

@property (nonatomic,assign)CGFloat  x;
@property (nonatomic,assign)CGFloat  y;
@property (nonatomic,assign)CGFloat  width;
@property (nonatomic,assign)CGFloat  height;

@property (nonatomic,assign)CGPoint  origin;
@property (nonatomic,assign)CGFloat  centerX;
@property (nonatomic,assign)CGFloat  centerY;
@property (nonatomic,assign)CGSize  size;

@end

NS_ASSUME_NONNULL_END
