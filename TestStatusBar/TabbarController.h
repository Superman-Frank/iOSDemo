//
//  TabbarController.h
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/16.
//  Copyright © 2020 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface TabbarController : UITabBarController

+(instancetype)instance;

-(void)selectItemUpdateUI;

-(void)pushToIVoice;

@property (nonatomic,strong)ViewController * vc;
@property (nonatomic,strong)SecondViewController * secondVc;
@property (nonatomic,strong)ThirdViewController * thirdVc;
@property (nonatomic,strong)FourthViewController * fourthVc;
@end

NS_ASSUME_NONNULL_END
