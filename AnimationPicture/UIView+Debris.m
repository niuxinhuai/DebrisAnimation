//
//  UIView+Debris.m
//  AnimationPicture
//
//  Created by 牛新怀 on 2017/12/11.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import "UIView+Debris.h"

@implementation UIView (Debris)

- (void)fragmenttationAnimation{
    // 先截图
    UIView *snapView = [self snapshotViewAfterScreenUpdates:YES];
    // 隐藏容器中的子控件
    for (UIView *view in self.subviews) {
        view.hidden = YES;
        
    }
    
    //self.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0];
    // 保存x坐标的数组
    NSMutableArray *xArray = [[NSMutableArray alloc] init];
    // 保存y坐标
    NSMutableArray *yArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < self.bounds.size.width; i = i + 10) {
        @autoreleasepool{
            [xArray addObject:@(i)];
        }
    }
    for (NSInteger i = 0; i < self.bounds.size.height; i = i + 10) {
        @autoreleasepool{
            [yArray addObject:@(i)];
        }
    }
    
    
    //这个保存所有的碎片
    NSMutableArray *snapshots = [[NSMutableArray alloc] init];
    for (NSNumber *x in xArray) {
        
        for (NSNumber *y in yArray) {
            @autoreleasepool{
                CGRect snapshotRegion = CGRectMake([x doubleValue], [y doubleValue], 10, 10);
                
                // resizableSnapshotViewFromRect 这个方法就是根据frame 去截图
                UIView *snapshot      = [snapView resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
                snapshot.frame        = snapshotRegion;
                [self addSubview:snapshot];
                [snapshots         addObject:snapshot];
            }

        }
    }
    
    
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         //  self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.05];
                         for (UIView *view in snapshots) {
                             @autoreleasepool{
                                 view.frame = CGRectOffset(view.frame, [self randomRange:200 offset:-100], [self randomRange:200 offset:self.frame.size.height/2]);
                                 self.alpha = 0.1;
                             }

                         }
                         
                     }
                     completion:^(BOOL finished) {
                         for (UIView *view in snapshots) {
                             [view removeFromSuperview];
                         }
                         [self removeFromSuperview];                         
                     }];
    
    
}
- (CGFloat)randomRange:(NSInteger)range offset:(NSInteger)offset{
    
    return (CGFloat)(arc4random()%range + offset);
}


@end
