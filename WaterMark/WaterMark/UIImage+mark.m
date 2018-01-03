//
//  UIImage+mark.m
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "UIImage+mark.h"
#import "UIImage+MultiFormat.h"

@implementation UIImage (mark)
//本地水印图片
- (instancetype)waterMarkImage:(UIImage *)markImage markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect{
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //绘制目标图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //绘制水印图片
    [markImage drawInRect:markImageRect];
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],  //设置字体
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

//网络水印图片
- (instancetype)waterMarkNetworkImageName:(NSString *)markNetworkImageName markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect {
    
    //网络的水印图片
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:markNetworkImageName]];
    UIImage *markImage = [UIImage sd_imageWithData:data];
    
   return [self waterMarkImage:markImage markImageRect:markImageRect markName:markName markNameRect:markNameRect];
    
    
}



@end
