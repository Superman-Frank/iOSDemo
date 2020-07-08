//
//  CustomTabBar.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/16.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "CustomTabBar.h"
#define pi 3.1415926
#define To_Radius(radius) ((pi * radius)/180)

@interface CustomTabBar()
@property (nonatomic,strong)UIButton * centerButton;

@end

@implementation CustomTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.zPosition = 999;
        
        UIImage * plusImage = [[UIImage imageNamed:@"btn_ivoice"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton * button = [[UIButton alloc]init];
        [button setImage:plusImage forState:0];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(btnClickMethod) forControlEvents:UIControlEventTouchUpInside];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(btnLongClickMethod:)];
        [button addGestureRecognizer:longPress];
        
        [self addSubview:button];
        self.centerButton = button;
        
    }
    return self;
}

-(void)btnLongClickMethod:(UILongPressGestureRecognizer*)gestureRecognizer{
    if([gestureRecognizer state] == UIGestureRecognizerStateBegan){
        if(self.centerLongClickBlock){
            self.centerLongClickBlock();
        }
    }
}
- (void)btnClickMethod{
    if (self.centerClickBlock) {
        self.centerClickBlock();
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    
    Class class = NSClassFromString(@"UITabBarButton");
    
//    self.centerButton.center.x = self.center.x;
    self.centerButton.center = CGPointMake(self.center.x, 0//调整中间按钮的中线点Y值
                                    );
    for (UIView * btn  in self.subviews) {//遍历tabbar的子控件
        
        if ([btn isKindOfClass:class]) {
           NSInteger viewIndex = btn.frame.origin.x / btn.frame.size.width;
            if (viewIndex < 2) {
                btn.center = CGPointMake(btn.frame.size.width * viewIndex, 0);
            }else{
               btn.center = CGPointMake(btn.frame.size.width *(viewIndex +1) , 0);
            }
        }
       
    }
    [self bringSubviewToFront:self.centerButton];
//    [self.centerButton bringSubviewToFront:self.];
}

- (void)drawRect:(CGRect)rect
{
    UIColor * color = [UIColor whiteColor];
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewHalfW = self.bounds.size.width / 2;
    CGFloat viewH = self.bounds.size.height;
    CGFloat radian = 8;
    CGFloat radius = self.centerButton.bounds.size.width / 2.0 + 2;
    UIBezierPath * path = [UIBezierPath bezierPath];
    /**
    起点A:(0, viewH);
    B(0, radian);
    C(radian, 0);
    D(viewHalfW - radius - radian, 1);
    X(viewHalfW, radius);
    D->X point1(viewHalfW - radius/2.0, 1); point2(viewHalfW - radius, radius);
    E(viewHalfW + radius + radian, 1);
    X->E point1(viewHalfW + radius/2.0, 1); point2(viewHalfW + radius, radius);
    F(viewW - radian, 0);
    G(viewW, radian);
    H(viewW, viewH);
    */
    //设置起点
    [path moveToPoint:CGPointMake(0, viewH)];
    //B
    [path addLineToPoint:CGPointMake(0, radian*2)];
    //C
    [path addQuadCurveToPoint:CGPointMake(radian*2, 0) controlPoint:CGPointMake(0, 0)];//设置终点和控制点
    //D
    [path addLineToPoint:CGPointMake(viewHalfW - radius - radian*2, 0)];
    //X
    [path addCurveToPoint: CGPointMake (viewHalfW, radius) controlPoint1: CGPointMake (viewHalfW - radius + radian, 0) controlPoint2: CGPointMake (viewHalfW - radius, radius)];
    //E
    [path addCurveToPoint: CGPointMake (viewHalfW + radius + radian*2, 0) controlPoint1: CGPointMake (viewHalfW + radius, radius) controlPoint2: CGPointMake (viewHalfW + radius - radian, 0)];
    //F
    [path addLineToPoint: CGPointMake (viewW - radian*2, 0)];
    //G
    [path addQuadCurveToPoint:CGPointMake(viewW, radian*2) controlPoint:CGPointMake(viewW, 0)];//设置终点和控制点
    //H
    [path addLineToPoint: CGPointMake (viewW, viewH)];
    
    [path closePath];
    [color setFill];
    
    [path fill];

    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowColor = [UIColor redColor].CGColor;
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 5;
    
    self.layer.shadowPath = path.CGPath;
}
//重写hitTest方法，监听中间按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //判断当前手指是否点击到中间按钮上，如果是，则响应按钮点击，其他则系统处理
    CGPoint newP = [self convertPoint:point toView:self.centerButton];
    //首先判断当前View是否被隐藏了，隐藏了就不需要处理了
    if ([self.centerButton pointInside:newP withEvent:event]) {
        return self.centerButton;
    }
    return [super hitTest:point withEvent:event];
}
@end
