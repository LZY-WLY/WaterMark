//
//  ViewController.m
//  WaterMark
//
//  Created by LZY on 18/1/2.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+mark.h"
#import "UIImageView+mark.h"

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
    // =======================  绘制本地水印图片  =======================
    //图片模板
    UIImage *image = [UIImage imageNamed:@"liutao"];
    //添加的水印图片
    UIImage *waterImage = [UIImage imageNamed:@"easyicon"];
    //添加的水印图片的rect
    CGFloat waterImageH = kWaterImageH * waterImage.size.height / waterImage.size.width;
    CGRect waterImageRect = CGRectMake(kScrrentW - kWaterImageH, 0, kWaterImageH, waterImageH);
    //添加的网络水印图片的rect
    CGRect waterNetworkImageRect = waterImageRect;
    //添加的水印文字的rect
    CGRect waterNameRect = CGRectMake((kScrrentW - 100) / 2.0, 10, 200, 30);
    
    //加载绘制本地水印后的图片
    //self.imageView.image = [image waterMarkImage:waterImage markImageRect:waterImageRect markName:@"刘涛女神" markNameRect:waterNameRect];
    
    //加载绘制网络水印后的图片
    self.imageView.image = [image waterMarkNetworkImageName:url markImageRect:waterNetworkImageRect markName:@"刘涛女神" markNameRect:waterNameRect];
    
    
    // =======================  绘制网络水印图片  =======================
    //[self.imageView setWaterMarkTargettImage:image markImageName:url markImageRect:waterImageRect markName:@"刘涛女神" markNameRect:waterNameRect];
}


@end
