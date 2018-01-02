//
//  UIImageView+mark.m
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "UIImageView+mark.h"
#import "UIImageView+WebCache.h"
#import "UIImage+mark.h"

@implementation UIImageView (mark)
- (void)setWaterMarkTargettImage:(UIImage *)targetImage markImageName:(NSString *)markImageName markImageRect:(CGRect)markImageRect markName:(NSString *)markName markNameRect:(CGRect)markNameRect {
    
    //默认的水印图片
    UIImage *placeholderImage = [UIImage imageNamed:@"easyicon"];
    [self sd_setImageWithURL:[NSURL URLWithString:markImageName] placeholderImage:targetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        UIImage *waterImage = image ? image : placeholderImage;
         self.image = [targetImage waterMarkImage:waterImage markImageRect:markImageRect markName:markName markNameRect:markNameRect];
    }];
}
@end
