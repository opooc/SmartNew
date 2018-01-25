//
//  UIView+DSYUIView_ex.m
//  SmartCompus
//
//  Created by doushuyao on 2018/1/21.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "UIView+DSYUIView_ex.h"

@implementation UIView (DSYUIView_ex)
-(void)moveToX:(CGFloat)X{
    CGRect rect = self.frame;
    rect.origin.x = X;
    self.frame = rect;
}
@end
