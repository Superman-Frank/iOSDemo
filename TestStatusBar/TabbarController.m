//
//  TabbarController.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/6/16.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "TabbarController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
@interface TabbarController ()
{
    NSInteger _selectItemIndex;
    CGRect originalViewFrame;
    BOOL showCustomer;
}

@property (nonatomic,strong)CustomTabBar * tabbar;

@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation TabbarController

+ (instancetype)instance
{
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController * vc = delegate.window.rootViewController;
    if ([vc isKindOfClass:[ThirdViewController class]]) {
        ThirdViewController * third = (ThirdViewController *)vc;
        return third;
    }else{
        return  nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
