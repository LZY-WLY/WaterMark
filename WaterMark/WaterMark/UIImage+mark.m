//
//  UIImage+mark.m
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "UIImage+mark.h"

@implementation UIImage (mark)
- (instancetype)waterMarkImage:(UIImage *)markImage markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect{
    
    CGSize size = self.size;
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //绘制目标图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //绘制水印图片
    [markImage drawInRect:markImageRect];
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:30],  //设置字体
                           NSForegroundColorAttributeName : [UIColor redColor]   //设置字体颜色
                           };
    
    //绘制水印文字
    [markName drawInRect:markNameRect withAttributes:attr];
    
    //获取绘制后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图片上下文
    UIGraphicsEndPDFContext();
    
    return image;
}
@end
