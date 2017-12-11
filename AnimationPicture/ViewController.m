//
//  ViewController.m
//  AnimationPicture
//
//  Created by 牛新怀 on 2017/12/11.
//  Copyright © 2017年 牛新怀. All rights reserved.
//
#define Main_Width [UIScreen mainScreen].bounds.size.width
#define Main_Height [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UIImageView * bgImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"主视图";
    [self.view addSubview:self.bgImageView];
}


- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"m8.jpg"];
        _bgImageView.center = CGPointMake(Main_Width/2, Main_Height/2);
        _bgImageView.bounds = CGRectMake(0, 0, 300, 300);
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushNextVC)];
        [_bgImageView addGestureRecognizer:tap];
    }
    return _bgImageView;
}

- (void)pushNextVC{
    SecondViewController * vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
