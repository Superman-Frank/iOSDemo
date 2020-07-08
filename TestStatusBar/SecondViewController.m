//
//  SecondViewController.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/23.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()
@property (nonatomic,strong)UIImageView * castView;
@property (nonatomic,strong)UIView * containView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.layer.shadowColor = [UIColor systemGreenColor].CGColor;
    
    [btn setTitle:@"点击哈" forState:0];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.castView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    self.castView.image = [UIImage imageNamed:@"MOGOS2AddFlow"];
    [self.view addSubview:self.castView];
    

    UIView * containView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    containView.backgroundColor = [UIColor systemPinkColor];
    self.containView = containView;
     containView.layer.masksToBounds = YES;
    containView.layer.backgroundColor = [UIColor lightGrayColor].CGColor;//背景色
     containView.layer.cornerRadius = 20.0;//圆角
     containView.layer.shadowColor = [UIColor blueColor].CGColor;//阴影颜色
     containView.layer.shadowOpacity = 0.8;//阴影透明度
     containView.layer.shadowOffset = CGSizeMake(3.0, 3.0);//阴影的偏移量
     containView.layer.borderColor = [UIColor redColor].CGColor;//边界颜色
     containView.layer.borderWidth = 2;//边界宽度
    
    CALayer * sublayer1 = [CALayer layer];
    sublayer1.backgroundColor = [UIColor blueColor].CGColor;
    sublayer1.frame = CGRectMake(0, 0,80,80);
    sublayer1.anchorPoint = CGPointMake(0.9, 0.5);
    sublayer1.position = CGPointMake(100,100);
    [containView.layer addSublayer:sublayer1];
    [self.view addSubview:containView];
    
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,nil,0.0,0);
    CGPathAddLineToPoint(path,nil,0.0,CGRectGetHeight(containView.bounds)/2);
    shapeLayer.path = path;
    shapeLayer.bounds = CGRectMake(0,0,5.0,CGRectGetHeight(containView.bounds)/2);
    shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer.position = CGPointMake(CGRectGetMidX(containView.bounds),CGRectGetMidY(containView.bounds));
    shapeLayer.lineWidth = 5.0;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    [containView.layer addSublayer:shapeLayer];
    
    CATextLayer * textLayer = [CATextLayer layer];
    NSString * text = @"hello world";
    NSAttributedString * attributeString = [[NSAttributedString alloc] initWithString:text];
    textLayer.string = text;
    textLayer.alignmentMode = @"center";
    textLayer.fontSize =12;
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    CGRect bounds;
    bounds.origin = CGPointMake(0, 0);
    bounds.size = attributeString.size;
    textLayer.bounds = bounds;
    textLayer.position = CGPointMake(100,100);
    [containView.layer addSublayer:textLayer];
    
    
    
    CALayer * imageLayer = [CALayer layer];
       imageLayer.bounds = CGRectMake(0,0,200,100);
       imageLayer.position = CGPointMake(200,200);
       imageLayer.contents = (id)[UIImage imageNamed:@"aaa"].CGImage;
       imageLayer.contentsGravity = kCAGravityResizeAspect;
       [containView.layer addSublayer:imageLayer];
//    [s]
//    __weak typeof (self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:1 animations:^{
//            weakSelf.contentView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
//        } completion:^(BOOL finished) {
//            [weakSelf.castView removeFromSuperview];
//        }];
//    });
    
    
}
-(void)injected{
    [self viewDidLoad];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.block) {
        self.block(@"我是第二个页面的信息");
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)click{
//    self.block(@"我是第yi个页面");
//    id popVC = self.navigationController.childViewControllers[self.navigationController.childViewControllers.count-2];

//    [self.navigationController popViewControllerAnimated:YES];
    
//    [UIView animateWithDuration:1 animations:^{
//         self.contentView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 400);
//     } completion:^(BOOL finished) {
//         [self.castView removeFromSuperview];
//     }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
