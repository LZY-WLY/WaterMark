//
//  UIImage+LZYWatermark.m
//  ExceptionTest
//
//  Created by yfmac001 on 2018/7/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "UIImage+LZYWatermark.h"

@implementation UIImage (LZYWatermark)

#pragma mark - 指定宽度按比例缩放
- (UIImage *)imageCompressForTargetWidth:(CGFloat)defineWidth {
    
    UIImage *newImage = nil;
    
    CGSize imageSize = self.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = defineWidth;
    
    CGFloat targetHeight = height / (width / targetWidth);
    
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    
    CGFloat scaleFactor = 0.0;
    
    CGFloat scaledWidth = targetWidth;
    
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    
    
    if(CGSizeEqualToSize(imageSize, size) ==NO){
        
        CGFloat widthFactor = targetWidth / width;
        
        CGFloat heightFactor = targetHeight / height;
        
        
        
        if(widthFactor > heightFactor){
            
            scaleFactor = widthFactor;
            
        }else{
            
            scaleFactor = heightFactor;
            
        }
        
        scaledWidth = width * scaleFactor;
        
        scaledHeight = height * scaleFactor;
        
        
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) *0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) *0.5;
            
        }
        
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    
    thumbnailRect.origin = thumbnailPoint;
    
    thumbnailRect.size.width = scaledWidth;
    
    thumbnailRect.size.height = scaledHeight;
    
    [self drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
        
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

#pragma mark - UIImage 图像旋转
- (UIImage*)rotateImageWithImageAngle:(CGFloat)imageAngle IsExpand:(BOOL)vIsExpand {
    CGSize imgSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    
    CGSize outputSize = imgSize;
    if (vIsExpand) {
        CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
        //旋转
        rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(imageAngle * M_PI / 180.0));
        
        outputSize = CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
    }
    
    UIGraphicsBeginImageContext(outputSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, outputSize.width / 2, outputSize.height / 2);
    CGContextRotateCTM(context, imageAngle * M_PI / 180.0);
    CGContextTranslateCTM(context, -imgSize.width / 2, -imgSize.height / 2);
    
    [self drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 为图片添加 文字水印
- (UIImage *)addTextWatermarkWithText:(NSString *)text textPoint:(CGPoint)textPoint size:(CGSize)size attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed {
    
    //开启图片上下文
    UIGraphicsBeginImageContext(size);
    
    //先把图片画进去上下文中
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //添加文字水印
    CGFloat textX = textPoint.x;
    CGFloat textY = textPoint.y;
    CGFloat textWidht = size.width - textX;
    CGFloat textHeight = [self textHeightWithText:text attributed:attributed textWidth:textWidht];
    [text drawInRect:CGRectMake(textX, textY, textWidht, textHeight) withAttributes:attributed];
    
    //获取处理好的水印图片
    UIImage *textWatermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片上下文
    UIGraphicsEndImageContext();
    
    return textWatermarkImage;
}

#pragma mark - 为图片添加 图片水印
- (UIImage *)addImageWatermarkWithImage:(UIImage *)image imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth size:(CGSize)size {
    //开启图片上下文
    UIGraphicsBeginImageContext(size);
    
    //先把图片画进去上下文中
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //添加图片水印
    UIImage *scaleImage = [image imageCompressForTargetWidth:imageWidth];
    [scaleImage drawAtPoint:imagePoint];
    
    //获取处理好的水印图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片上下文
    UIGraphicsEndImageContext();
    
    return watermarkImage;
}

#pragma mark - 为图片添加 图片水印 旋转
- (UIImage *)addImageWatermarkWithImage:(UIImage *)image imagePoint:(CGPoint)imagePoint imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size {
    //开启图片上下文
    UIGraphicsBeginImageContext(size);
    
    //先把图片画进去上下文中
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //添加图片水印
    UIImage *scaleImage = [[image imageCompressForTargetWidth:imageWidth] rotateImageWithImageAngle:imageAngle IsExpand:YES];
    [scaleImage drawAtPoint:imagePoint];
    
    //获取处理好的水印图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片上下文
    UIGraphicsEndImageContext();
    
    return watermarkImage;
}

#pragma mark - 为图片添加 文字和图片水印
- (UIImage *)addGatherWithText:(NSString *)text image:(UIImage *)image textPoint:(CGPoint)textPoint imagePoint:(CGPoint)imagePoint attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed imageWidth:(CGFloat)imageWidth imageAngle:(CGFloat)imageAngle size:(CGSize)size {
    //开启图片上下文
    UIGraphicsBeginImageContext(size);
    
    //先把图片画进去上下文中
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //添加文字水印
    CGFloat textX = textPoint.x;
    CGFloat textY = textPoint.y;
    CGFloat textWidht = size.width - textX;
    CGFloat textHeight = [self textHeightWithText:text attributed:attributed textWidth:textWidht];
    [text drawInRect:CGRectMake(textX, textY, textWidht, textHeight) withAttributes:attributed];
    
    //添加图片水印
    UIImage *scaleImage = [[image imageCompressForTargetWidth:imageWidth] rotateImageWithImageAngle:imageAngle IsExpand:YES];
    [scaleImage drawAtPoint:imagePoint];
    
    //获取处理好的水印图片
    UIImage *gatherImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片上下文
    UIGraphicsEndImageContext();
    
    return gatherImage;
}

#pragma mark - 计算文字的高度
- (CGFloat)textHeightWithText:(NSString *)text attributed:(NSDictionary<NSAttributedStringKey,id> *)attributed textWidth:(CGFloat)textWidth {
    return [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributed context:nil].size.height;
}
@end
