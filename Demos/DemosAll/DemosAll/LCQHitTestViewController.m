//
//  LCQHitTestViewController.m
//  DemosAll
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.


//新浪面试题之--UIBUutton上有不规则图形，点击不规则图形响应事件。

#import "LCQHitTestViewController.h"
#import "LCQHitTestButton.h"
#import "LCQTestBtnSubView.h"
#import "LCQTestSubview.h"

@interface LCQHitTestViewController ()

@end

@implementation LCQHitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //btn
    LCQHitTestButton *btn = [[LCQHitTestButton alloc]initWithFrame:CGRectMake(100 , 100, 100, 100)];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //btnSubview
    LCQTestBtnSubView *subView = [[LCQTestBtnSubView alloc]initWithFrame:CGRectMake(35, 35, 30, 30)];
    //center is relative to view's superview
    NSLog(@"btn-center: %@",NSStringFromCGPoint(btn.center));
    [btn addSubview:subView];
    
    
    LCQTestBtnSubView *subView1 = [[LCQTestBtnSubView alloc]initWithFrame:CGRectMake(35, 200, 100, 100)];
    //center is relative to view's superview
    NSLog(@"btn-center: %@",NSStringFromCGPoint(btn.center));
    [self.view addSubview:subView1];
    
    LCQTestSubview *subView2 = [[LCQTestSubview alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    subView2.backgroundColor = [UIColor cyanColor];
    //center is relative to view's superview
    NSLog(@"btn-center: %@",NSStringFromCGPoint(btn.center));
    [subView1 addSubview:subView2];
    
}
-(void)btnclick{
    
    NSLog(@"btn--Clicked!");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
