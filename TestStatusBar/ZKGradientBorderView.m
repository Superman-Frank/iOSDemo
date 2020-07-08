//
//  ZKGradientBorderView.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/8.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "ZKGradientBorderView.h"
#define Percent 1

@interface ZKGradientBorderView()
@property (nonatomic,strong)UIView * backCircleView;

@end


@implementation ZKGradientBorderView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backCircleView];
        [self setupBorderAndRadius];
    }
    return self;
}
-(void)setupBorderAndRadius{
    //以圆心做渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, (self.frame.size.height-self.frame.size.width)/2, self.frame.size.width, self.frame.size.width);
    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor purpleColor].CGColor];
    gradientLayer.type = kCAGradientLayerRadial;
    gradientLayer.startPoint = CGPointMake(.5, .5);
    gradientLayer.endPoint = CGPointMake(.0, 1);
    
    //设置圆角蒙版
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 3*Percent;
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_backCircleView.frame.origin.x, (gradientLayer.frame.size.height-_backCircleView.frame.size.height)/2, _backCircleView.frame.size.width, _backCircleView.frame.size.height) cornerRadius:(_backCircleView.frame.size.height)/2].CGPath;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    gradientLayer.mask = shapeLayer;
    [self.layer insertSublayer:gradientLayer above:_backCircleView.layer];
    
    //设置下阴影
    CALayer *subLayer1 = [CALayer layer];
    subLayer1.frame = _backCircleView.frame;
    subLayer1.masksToBounds = NO;
    subLayer1.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    subLayer1.cornerRadius = _backCircleView.frame.size.height/2;
    subLayer1.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.7].CGColor;
    subLayer1.shadowOffset = CGSizeMake(0*Percent, 4*Percent);
    subLayer1.shadowOpacity = 1;
    subLayer1.shadowRadius = 4*Percent;
    [self.layer insertSublayer:subLayer1 below:_backCircleView.layer];
    
    //设置上阴影
    CALayer *subLayer2 = [CALayer layer];
    subLayer2.frame = _backCircleView.frame;
    subLayer2.masksToBounds = NO;
    subLayer2.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    subLayer2.cornerRadius = _backCircleView.frame.size.height/2;
    subLayer2.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.7].CGColor;
    subLayer2.shadowOffset = CGSizeMake(0*Percent, -4*Percent);
    subLayer2.shadowOpacity = 1;
    subLayer2.shadowRadius = 4*Percent;
    [self.layer insertSublayer:subLayer2 below:_backCircleView.layer];
    
}
- (UIView *)backCircleView
{
    if (!_backCircleView) {
        UIView *backCircleView = [[UIView alloc] initWithFrame:CGRectMake(3*Percent, 3*Percent, self.frame.size.width-6*Percent, self.frame.size.height-6*Percent)];
        backCircleView.backgroundColor = [[UIColor systemBlueColor] colorWithAlphaComponent:0.7];
        backCircleView.layer.masksToBounds = YES;
        backCircleView.layer.cornerRadius = backCircleView.frame.size.height/2;
        _backCircleView = backCircleView;
    }
    return _backCircleView;;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
