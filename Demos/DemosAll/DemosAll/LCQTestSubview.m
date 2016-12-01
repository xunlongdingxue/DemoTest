//
//  LCQTestSubview.m
//  DemosAll
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.


//https://developer.apple.com/library/content/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/event_delivery_responder_chain/event_delivery_responder_chain.html#//apple_ref/doc/uid/TP40009541-CH4-SW3



#import "LCQTestSubview.h"

@implementation LCQTestSubview

//ovride
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

//如果加上会最上面视图响应，不加的话，就往上传递（window方向）
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%@",self);
//    
//}
@end
