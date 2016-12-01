//
//  LCQTestBtnSubView.m
//  DemosAll
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.
//

#import "LCQTestBtnSubView.h"

@implementation LCQTestBtnSubView

//ovride
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

//overide hitTest:
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
    
}

//overide pointInside:
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return [super pointInside:point withEvent:event];
}

//overide touchesBegan:
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%@",self);
//    
//}
@end
