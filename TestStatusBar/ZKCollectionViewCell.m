//
//  ZKCollectionViewCell.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/7.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "ZKCollectionViewCell.h"
#import <Masonry/Masonry.h>
#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width

@implementation ZKCollectionViewCell
{
    UIImageView *_img;
    UILabel *_name;
    UILabel *_price;
    UILabel *_number;
    CGFloat _width;
    UIButton *_buy;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _width = floorf((ScreenWidth - 30) * 0.5);
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    _img = [UIImageView new];
    int index = arc4random() % 5;
    _img.image = [UIImage imageNamed:[NSString stringWithFormat:@"yunEr%d.jpg",index+1]];
    _img.layer.masksToBounds = YES;
    _img.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_img];
    
    _name = [UILabel new];
    _name.text = @"允儿，真可爱😊😊😊";
    _name.font = [UIFont systemFontOfSize:14];
    _name.adjustsFontSizeToFitWidth = YES;
    _name.minimumScaleFactor = 0.5;
    [self.contentView addSubview:_name];
    
    _price = [UILabel new];
    _price.text = @"99.9元";
    _price.font = [UIFont boldSystemFontOfSize:13];
    _price.textColor = [UIColor redColor];
    _price.adjustsFontSizeToFitWidth = YES;
    _price.minimumScaleFactor = 0.5;
    [self.contentView addSubview:_price];
    
    _number = [UILabel new];
    _number.text = @"已售999件";
    _number.font = [UIFont systemFontOfSize:12];
    _number.textColor = [UIColor grayColor];
    _number.adjustsFontSizeToFitWidth = YES;
    _number.minimumScaleFactor = 0.5;
    [self.contentView addSubview:_number];
    
    _buy = [UIButton new];
    _buy.backgroundColor = [UIColor redColor];
    [_buy setTitle:@"立即购买" forState:(UIControlStateNormal)];
    _buy.titleLabel.font = [UIFont systemFontOfSize:13];
    [_buy addTarget:self action:@selector(buyClickMethod) forControlEvents:(UIControlEventTouchUpInside)];
    [self.contentView addSubview:_buy];
}
- (void)setIsList:(BOOL)isList{
    if(isList){
        if(self.animation){
            [UIView animateWithDuration:0.25 animations:^{
                [self setListFrame];
            }];
        }else{
            [self setListFrame];
        }
    }else{
        
        if(self.animation){
            [UIView animateWithDuration:0.25 animations:^{
                [self setGridFrame];
            }];
        }else{
            [self setGridFrame];
        }
    }
    
    if(self.animation){
        [UIView animateWithDuration:0.25 animations:^{
           [self.contentView layoutIfNeeded];
        }];
    }
}

-(void)setListFrame{
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView);
        make.width.height.mas_equalTo(100);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(_img.mas_right).offset(10);
        make.width.mas_equalTo(ScreenWidth-100-20);
        make.height.mas_equalTo(20);
    }];

    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.mas_bottom);
        make.left.width.height.equalTo(_name);
    }];

    [_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_price.mas_bottom);
        make.left.width.height.equalTo(_name);
    }];
    
    [_buy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_number.mas_bottom);
        make.left.equalTo(_name);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
}

-(void)setGridFrame{
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView);
        make.width.height.mas_equalTo(_width);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView.mas_right).offset(10);
        make.width.mas_equalTo(_width - 20);
        make.height.mas_equalTo(20);
    }];

    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.mas_bottom);
        make.left.width.height.equalTo(_name);
    }];

    [_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_price.mas_bottom);
        make.left.equalTo(_name);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    [_buy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_number.mas_bottom);
        make.left.equalTo(_number.mas_right);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(80);
    }];
}
-(void)buyClickMethod{
    if (self.buyClick) {
        self.buyClick();
    }
}
@end
