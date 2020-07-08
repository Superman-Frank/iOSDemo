//
//  MyView.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/15.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "MyView.h"
/*
  drawRect:方法的调用时机：
 它是在init和viewDidLoad方法执行之后，才开始调用的，因此，我们可以在init方法中设置相应的参数：
 
 */
@implementation MyView
{
    //虚线距离顶部的距离
    CGFloat _frontHeight;
    //两个小半圆的半径
    CGFloat _radii;
    //顶部圆角的view半径
    CGFloat _topRadius;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _frontHeight = 64.f;
        _radii = 8.f;
        _topRadius = 10.f;
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}
-(void)createUI{
//    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    v.backgroundColor = [UIColor yellowColor];
//    [self addSubview:v];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 100);
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 100, 200);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
}
//在drawRect方法中开始绘制图形
- (void)drawRect:(CGRect)rect {
    CGFloat viewWidth = rect.size.width;
    CGFloat viewHeight = rect.size.height;
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //绘制整体背景
    CGContextMoveToPoint(ctx, _topRadius, 0);
    CGContextAddLineToPoint(ctx, viewWidth - _topRadius, 0);
    //绘制圆形
    CGContextAddArc(ctx, viewWidth - _topRadius, _topRadius, _topRadius, 3/2*M_PI, 0, 0);
    CGContextAddLineToPoint(ctx, viewWidth, _frontHeight - _radii);
    CGContextAddArc(ctx, viewWidth, _frontHeight, _radii, 1.5 * M_PI, -M_PI_2, 1);
    CGContextAddLineToPoint(ctx, viewWidth, viewHeight);
    CGContextAddLineToPoint(ctx, 0, viewHeight);
    CGContextAddLineToPoint(ctx, 0,  64);
    CGContextAddArc(ctx, 0, _frontHeight, _radii, 1.5 * M_PI, -M_PI_2, 1);
    CGContextAddLineToPoint(ctx, 0, _frontHeight + _radii);
    CGContextAddArc(ctx, 0, _frontHeight, _radii, -M_PI_2, 3 * M_PI_2, 1);
    CGContextAddLineToPoint(ctx, 0, _topRadius);
    CGContextAddArc(ctx, _topRadius, _topRadius, _topRadius, M_PI, M_PI * 1.5, 0);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

@end
