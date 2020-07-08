//
//  DrawStringView.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/5/29.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "DrawStringView.h"

@implementation DrawStringView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//    }
//    return self;
//}

- (id)initWithContent:(NSString *)content Frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentString = content;
        self.opaque = NO; // 不透明
    }
    return self;
}
- (void)setContentString:(NSString *)contentString
{
    _contentString = contentString;
    //重新绘制，调用drawrect
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;//居中
        style.lineBreakMode = NSLineBreakByWordWrapping;//以词为单位换行
        UIFont * font = [UIFont fontWithName:@"Helvetica" size:30];
        NSMutableAttributedString * attributeStirng = [[NSMutableAttributedString alloc]initWithString:self.contentString];
        NSDictionary *  firstPartAttributes = @{ NSFontAttributeName:font,// 字体
                                                NSParagraphStyleAttributeName:style,//绘制样式
                                                NSForegroundColorAttributeName:[UIColor systemGreenColor],//填充色
                                                NSStrokeColorAttributeName:[UIColor blueColor],//描边色
                                                NSStrokeWidthAttributeName:@(3)//描边线宽
                                                };
        NSDictionary * secondPartAttributes = @{ NSFontAttributeName:font,
                                                 NSParagraphStyleAttributeName:style,
                                                 NSForegroundColorAttributeName:[UIColor whiteColor],
                                                 NSStrokeColorAttributeName:[UIColor redColor],
                                                 NSStrokeWidthAttributeName:@(3)
                                                 };
        NSUInteger halfLocation = (int)attributeStirng.length/2;
        [attributeStirng addAttributes:firstPartAttributes range:NSMakeRange(0,halfLocation)];//前一半的样式
        [attributeStirng addAttributes:secondPartAttributes range:NSMakeRange(halfLocation,attributeStirng.length - halfLocation)];//后一半的样式
        [attributeStirng drawInRect:self.bounds];
    
    
}
@end
