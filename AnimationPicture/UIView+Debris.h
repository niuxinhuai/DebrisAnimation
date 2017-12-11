//
//  UIView+Debris.h
//  AnimationPicture
//
//  Created by 牛新怀 on 2017/12/11.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Debris)

/*
 pop返回碎片动画
 @property  调用示例
 
 [[UIApplication sharedApplication].keyWindow addSubview:self.view];
 [self.view fragmenttationAnimation];
 [self.navigationController popViewControllerAnimated:NO];
 
 */
- (void)fragmenttationAnimation;

@end
