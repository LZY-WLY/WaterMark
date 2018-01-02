//
//  UIImageView+mark.h
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (mark)
/**
 获取水印图片

 @param targetImage 图片模板
 @param markImageName 添加的水印图片(网络获取)
 @param markImageRect 添加的水印图片的区域
 @param markName 添加的水印文字
 @param markNameRect 添加的水印文字的区域
 */
- (void)setWaterMarkTargettImage:(UIImage *)targetImage markImageName:(NSString *)markImageName markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect;
@end
