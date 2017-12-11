//
//  SecondViewController.m
//  AnimationPicture
//
//  Created by 牛新怀 on 2017/12/11.
//  Copyright © 2017年 牛新怀. All rights reserved.
//
#define Main_Width [UIScreen mainScreen].bounds.size.width
#define Main_Height [UIScreen mainScreen].bounds.size.height

#import "SecondViewController.h"
#import "UIView+Debris.h"
@interface SecondViewController ()
@property (nonatomic, strong) UIImageView * debrisAnimationImageView;
@property (nonatomic, strong) UIImageView * animationImageV;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"碎片动画返回效果";
    [self.view addSubview:self.debrisAnimationImageView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (UIImageView *)debrisAnimationImageView{
    if (!_debrisAnimationImageView) {
        _debrisAnimationImageView = [[UIImageView alloc]init];
        _debrisAnimationImageView.frame = CGRectMake(0, 64, Main_Width, Main_Height-64);
        _debrisAnimationImageView.contentMode = UIViewContentModeScaleAspectFill;
        _debrisAnimationImageView.image = [UIImage imageNamed:@"we.jpeg"];
        _debrisAnimationImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didSelectDebrisImageView)];
        [_debrisAnimationImageView addGestureRecognizer:tap];
    }
    return _debrisAnimationImageView;
}

- (UIImageView *)animationImageV{
    if (!_animationImageV) {
        _animationImageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
        [[UIApplication sharedApplication].keyWindow addSubview:_animationImageV];
    }
    return _animationImageV;
}

- (void)didSelectDebrisImageView{
        [[UIApplication sharedApplication].keyWindow addSubview:self.view];
        [self.view fragmenttationAnimation];
    

    [self.navigationController popViewControllerAnimated:NO];
}

@end
