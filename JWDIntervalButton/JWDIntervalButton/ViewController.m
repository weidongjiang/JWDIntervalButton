//
//  ViewController.m
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/13.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import "ViewController.h"
#import "JWDIntervalButton.h"
#import "JWDTouchAreaButton.h"
#import "UIButton+layoutButtonWithEdgeInsets.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor yellowColor];

    JWDIntervalButton *button = [[JWDIntervalButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.timeInterval = 3;
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


    JWDTouchAreaButton *touchAreaButtont = [[JWDTouchAreaButton alloc] initWithFrame:CGRectMake(100, 225, 100, 20)];
    touchAreaButtont.titleLabel.font = [UIFont systemFontOfSize:12];
    [touchAreaButtont setBackgroundColor:[UIColor redColor]];
    [touchAreaButtont setTouchAreaEdgeInsets:UIEdgeInsetsMake(-100, -100, -100, -100)];
    [touchAreaButtont setTitle:@"touchAreaButton" forState:UIControlStateNormal];
    [touchAreaButtont addTarget:self action:@selector(touchAreaButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchAreaButtont];


    [self setLayoutButtonWithEdgeInsets];

}

- (void)setLayoutButtonWithEdgeInsets {

    JWDTouchAreaButton *arrowButtont = [[JWDTouchAreaButton alloc] initWithFrame:CGRectMake(10, 325, 60, 60)];
    arrowButtont.titleLabel.font = [UIFont systemFontOfSize:12];
    [arrowButtont setBackgroundColor:[UIColor whiteColor]];
    [arrowButtont setImage:[UIImage imageNamed:@"arrowimage"] forState:UIControlStateNormal];
    [arrowButtont setTitle:@"返回" forState:UIControlStateNormal];
    [arrowButtont setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [arrowButtont jwd_layoutButtonWithEdgeInsetsStyle:JWDButtonEdgeInsetsStyleImageTop imageTitlespace:10];
    [self.view addSubview:arrowButtont];

    JWDTouchAreaButton *arrowButtont_1 = [[JWDTouchAreaButton alloc] initWithFrame:CGRectMake(80, 325, 60, 60)];
    arrowButtont_1.titleLabel.font = [UIFont systemFontOfSize:12];
    [arrowButtont_1 setBackgroundColor:[UIColor whiteColor]];
    [arrowButtont_1 setImage:[UIImage imageNamed:@"arrowimage"] forState:UIControlStateNormal];
    [arrowButtont_1 setTitle:@"返回" forState:UIControlStateNormal];
    [arrowButtont_1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [arrowButtont_1 jwd_layoutButtonWithEdgeInsetsStyle:JWDButtonEdgeInsetsStyleImageBottom imageTitlespace:10];
    [self.view addSubview:arrowButtont_1];

    JWDTouchAreaButton *arrowButtont_2 = [[JWDTouchAreaButton alloc] initWithFrame:CGRectMake(150, 325, 60, 60)];
    arrowButtont_2.titleLabel.font = [UIFont systemFontOfSize:12];
    [arrowButtont_2 setBackgroundColor:[UIColor whiteColor]];
    [arrowButtont_2 setImage:[UIImage imageNamed:@"arrowimage"] forState:UIControlStateNormal];
    [arrowButtont_2 setTitle:@"返回" forState:UIControlStateNormal];
    [arrowButtont_2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [arrowButtont_2 jwd_layoutButtonWithEdgeInsetsStyle:JWDButtonEdgeInsetsStyleImageLeft imageTitlespace:10];
    [self.view addSubview:arrowButtont_2];

    JWDTouchAreaButton *arrowButtont_3 = [[JWDTouchAreaButton alloc] initWithFrame:CGRectMake(220, 325, 60, 60)];
    arrowButtont_3.titleLabel.font = [UIFont systemFontOfSize:12];
    [arrowButtont_3 setBackgroundColor:[UIColor whiteColor]];
    [arrowButtont_3 setImage:[UIImage imageNamed:@"arrowimage"] forState:UIControlStateNormal];
    [arrowButtont_3 setTitle:@"返回" forState:UIControlStateNormal];
    [arrowButtont_3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [arrowButtont_3 jwd_layoutButtonWithEdgeInsetsStyle:JWDButtonEdgeInsetsStyleImageRight imageTitlespace:10];
    [self.view addSubview:arrowButtont_3];

}


- (void)buttonDidClick {
    NSLog(@"-----点击了");
}

- (void)touchAreaButtonDidClick {
    NSLog(@"可以改变点击区域了");
}

@end
