//
//  UIImageView+LZYWatermark.m
//  WaterMark
//
//  Created by yfmac001 on 2018/7/27.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "UIImageView+LZYWatermark.h"
#import "UIImage+LZYWatermark.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (LZYWatermark)

#pragma mark - 文字水印
- (void)addTextWatermarkWithImageName:(NSString *)imageName text:(NSString *)text textPoint:(CGPoint)textPoint size:(CGSize)size attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed {
    [self sd_setImageWithURL:[NSURL URLWithString:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image addTextWatermarkWithText:text textPoint:textPoint size:size attributed:attributed];
    }];
}

#pragma mark - 水印图片
- (void)addImageWatermarkWithImageName:(NSString *)imageName watermarkImage:(UIImage *)watermarkImage imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth size:(CGSize)size {
    [self sd_setImageWithURL:[NSURL URLWithString:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image addImageWatermarkWithImage:watermarkImage imagePoint:imagePoint imageWidth:imageWidth size:size];
    }];
}

#pragma mark - 水印图片 旋转
- (void)addImageWatermarkWithImageName:(NSString *)imageName watermarkImage:(UIImage *)watermarkImage imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size {
    [self sd_setImageWithURL:[NSURL URLWithString:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image addImageWatermarkWithImage:watermarkImage imagePoint:imagePoint imageWidth:imageWidth imageAngle:imageAngle size:size];
    }];
}

#pragma mark - 文字和图片水印
- (void)addGatherWithImageName:(NSString *)imageName text:(NSString *)text watermarkImage:(UIImage *)watermarkImage textPoint:(CGPoint)textPoint imagePoint:(CGPoint)imagePoint attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size {
    [self sd_setImageWithURL:[NSURL URLWithString:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image addGatherWithText:text image:watermarkImage textPoint:textPoint imagePoint:imagePoint attributed:attributed imageWidth:imageWidth imageAngle:imageAngle size:size];
    }];
}
@end
