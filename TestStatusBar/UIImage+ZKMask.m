//
//  UIImage+ZKMask.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/7/15.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "UIImage+ZKMask.h"

@implementation UIImage (ZKMask)

- (UIImage *)maskImage:(UIColor *)maskColor
{
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextSetFillColorWithColor(context, maskColor.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}
@end
