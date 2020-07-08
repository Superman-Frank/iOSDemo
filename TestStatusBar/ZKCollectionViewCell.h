//
//  ZKCollectionViewCell.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/7.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy)void(^buyClick)(void);
@property (nonatomic,assign)BOOL  isList;
@property (nonatomic,assign)BOOL  animation;

@end

NS_ASSUME_NONNULL_END
