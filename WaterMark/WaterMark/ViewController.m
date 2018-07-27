//
//  ViewController.m
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+LZYWatermark.h"

#define kScrrentW [UIScreen mainScreen].bounds.size.width
#define kScrrentH [UIScreen mainScreen].bounds.size.height
#define kWaterImageH 150


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //网络图片地址
    NSString *url = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514900854889&di=6172e4aef493d8b2e74589da2d0b1251&imgtype=0&src=http%3A%2F%2Fpic13.nipic.com%2F20110419%2F6782757_171000681191_2.jpg";
    
    //添加的水印图片
    UIImage *waterImage = [UIImage imageNamed:@"easyicon"];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    //文字水印
//    [self.imageView addTextWatermarkWithImageName:url text:@"我是大角牛" textPoint:CGPointMake(150, 20) size:[UIScreen mainScreen].bounds.size attributed:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName : [UIColor redColor]}];
    
    //水印图片
//    [self.imageView addImageWatermarkWithImageName:url watermarkImage:waterImage imagePoint:CGPointMake(screenW - 100, 0) imageWidth:100 size:[UIScreen mainScreen].bounds.size];
    
    //水印图片 旋转
//    [self.imageView addImageWatermarkWithImageName:url watermarkImage:waterImage imagePoint:CGPointMake(screenW - 150, 0) imageWidth:100 imageAngle:45 size:[UIScreen mainScreen].bounds.size];
    
    
    //图片 文字 水印
    [self.imageView addGatherWithImageName:url text:@"我是大角牛" watermarkImage:waterImage textPoint:CGPointMake(150, 20) imagePoint:CGPointMake(screenW - 100, 0) attributed:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName : [UIColor redColor]} imageWidth:100 imageAngle:0 size:[UIScreen mainScreen].bounds.size];
    
    
    
}


@end
