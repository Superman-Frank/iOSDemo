//
//  SectionView.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/8.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "SectionView.h"
@interface SectionView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UITextField *accountView;
@property (weak, nonatomic) IBOutlet UITextField *passwordView;

- (IBAction)loginBtn:(id)sender;


@end
@implementation SectionView

+ (instancetype)sectionView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"SectionView" owner:nil options:nil]lastObject];
}

- (IBAction)loginBtn:(id)sender {
    if ([self.accountView.text isEqualToString:@""]) {
        NSLog(@"请输入账号");
        return;
    }
    if ([self.passwordView.text isEqualToString:@""]) {
        NSLog(@"请输入密码");
        return;
    }
    
    if ([self.accountView.text isEqualToString:@"1"] &&[self.passwordView.text isEqualToString:@"1"]) {
        NSLog(@"登陆成功");
    }
}
@end
