//
//  UIImage+UIImage_imageOriginal.m
//  SmartCompus
//
//  Created by doushuyao on 2018/1/19.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "UIImage+UIImage_imageOriginal.h"

@implementation UIImage (UIImage_imageOriginal)
+ (UIImage *)imageOriginalWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
