//
//  UIImage+mark.h
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (mark)
/**
 为本地图片添加水印

 @param markImage 添加的水印图片
 @param markImageRect 添加的水印图片的区域
 @param markName 添加的水印文字
 @param markNameRect 添加的水印文字的区域
 @return 绘制好的水印图片
 */
- (instancetype)waterMarkImage:(UIImage *)markImage markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect;

/**
 为网络图片添加水印
 
 @param markNetworkImageName 添加的网络水印图片网址
 @param markImageRect 加的网络水印图片的区域
 @param markName 添加的水印文字
 @param markNameRect 添加的水印文字的区域
 @return 绘制好的水印图片
 */
- (instancetype)waterMarkNetworkImageName:(NSString *)markNetworkImageName markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect;
@end
