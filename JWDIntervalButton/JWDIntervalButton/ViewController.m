//
//  ViewController.m
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/13.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import "ViewController.h"
#import "JWDIntervalButton.h"

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

}


- (void)buttonDidClick {
    NSLog(@"-----点击了");
}


@end
