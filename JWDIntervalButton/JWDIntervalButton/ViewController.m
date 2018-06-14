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

}


- (void)buttonDidClick {
    NSLog(@"-----点击了");
}

- (void)touchAreaButtonDidClick {
    NSLog(@"可以改变点击区域了");
}

@end
