//
//  UIImageView+LZYWatermark.h
//  WaterMark
//
//  Created by yfmac001 on 2018/7/27.
//  Copyright © 2018年 LZY. All rights reserved.
//  为 UIImageView 添加水印 工具类

#import <UIKit/UIKit.h>

@interface UIImageView (LZYWatermark)

/**
 文字水印
 @param imageName 加载图片的地址
 @param text 文字水印
 @param textPoint 文字水印的起点
 @param size 绘图尺寸 一般为 UIImageView的尺寸
 @param attributed 文字水印的起点属性
 */
- (void)addTextWatermarkWithImageName:(NSString *)imageName text:(NSString *)text textPoint:(CGPoint)textPoint size:(CGSize)size attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed;

/**
 水印图片
 @param imageName 加载图片的地址
 @param watermarkImage 添加的水印图片
 @param imagePoint 水印图片的起点
 @param imageWidth 水印图片的宽度
 @param size 绘图尺寸 一般为 UIImageView的尺寸
 */
- (void)addImageWatermarkWithImageName:(NSString *)imageName watermarkImage:(UIImage *)watermarkImage imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth size:(CGSize)size;

/**
 水印图片 旋转
 @param imageName 加载图片的地址
 @param watermarkImage 添加的水印图片
 @param imagePoint 水印图片的起点
 @param imageWidth 水印图片的宽度
 @param imageAngle 水印图片旋转的角度
 @param size 绘图尺寸 一般为 UIImageView的尺寸
 */
- (void)addImageWatermarkWithImageName:(NSString *)imageName watermarkImage:(UIImage *)watermarkImage imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size;

/**
 文字和图片水印
 @param imageName 加载图片的地址
 @param text 需要添加的水印文字
 @param watermarkImage 需要添加的水印图片
 @param textPoint 需要添加水印文字的起点
 @param imagePoint 需要添加水印图片的起点
 @param attributed 水印文字的属性
 @param imageWidth 需要添加水印图片的宽度
 @param imageAngle 需要添加水印图片旋转的角度 如果不旋转 就传入 0
 @param size 绘图的尺寸
 */
- (void)addGatherWithImageName:(NSString *)imageName text:(NSString *)text watermarkImage:(UIImage *)watermarkImage textPoint:(CGPoint)textPoint imagePoint:(CGPoint)imagePoint attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size;
@end
