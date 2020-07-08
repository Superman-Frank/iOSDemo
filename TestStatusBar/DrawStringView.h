//
//  DrawStringView.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/5/29.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawStringView : UIView
@property (nonatomic,copy)NSString * contentString;
-(id)initWithContent:(NSString *)content Frame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
