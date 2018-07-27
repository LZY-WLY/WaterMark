//
//  UIImage+LZYWatermark.h
//  ExceptionTest
//
//  Created by yfmac001 on 2018/7/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//  为 UIImage 添加水印 工具类

#import <UIKit/UIKit.h>

@interface UIImage (LZYWatermark)
/**
 指定宽度按比例缩放
 @param defineWidth 压缩图片的宽度
 @return 压缩好的图片
 */
- (UIImage *)imageCompressForTargetWidth:(CGFloat)defineWidth;

/**
 UIImage 图像旋转
 @param imageAngle 旋转角度
 @param vIsExpand 是否扩展，如果不扩展，那么图像大小不变，但被截掉一部分
 @return 旋转后的图片
 */
- (UIImage*)rotateImageWithImageAngle:(CGFloat)imageAngle IsExpand:(BOOL)vIsExpand;

/**
 为图片添加 文字水印
 @param text 需要添加的水印文字
 @param textPoint 需要添加水印文字的起点
 @param size 绘图的尺寸
 @param attributed 水印文字的属性
 @return 处理好的水印图片
 */
- (UIImage *)addTextWatermarkWithText:(NSString *)text textPoint:(CGPoint)textPoint size:(CGSize)size attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed;

/**
 为图片添加 图片水印
 @param image 需要添加的水印图片
 @param imagePoint 需要添加水印图片的起点
 @param imageWidth 需要添加水印图片的宽度
 @param size 绘图的尺寸
 @return 处理好的水印图片
 */
- (UIImage *)addImageWatermarkWithImage:(UIImage *)image imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth size:(CGSize)size;

/**
 为图片添加 图片水印 旋转
 @param image 需要添加的水印图片
 @param imagePoint 需要添加水印图片的起点
 @param imageWidth 需要添加水印图片的宽度
 @param imageAngle 需要添加水印图片旋转的角度
 @param size 绘图的尺寸
 @return 处理好的水印图片
 */
- (UIImage *)addImageWatermarkWithImage:(UIImage *)image imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size;
@end
