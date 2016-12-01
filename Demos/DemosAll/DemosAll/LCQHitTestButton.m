//
//  LCQHitTestButton.m
//  DemosAll
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.





/*
 0 调用根视图的hitTtest:withEvent，其的执行过程如下：
 
 *Ie calls pointInside:withEvent:of self
 *If the return is NO,  hitTest:withEvent:  returns  nil . the end of the story.
 *If the return is YES, it sends  hitTest:withEvent:  messages to its subviews. it starts from the top-level subview, and continues to other views until a subview returns a non- nil  object, or all subviews receive the message.
 *If a subview returns a non- nil  object in the first time, the first  hitTest:withEvent:  returns that object. the end of the story.
 *If no subview returns a non- nil  object, the first  hitTest:withEvent:  returns  self
 //http://www.cnblogs.com/mjios/archive/2013/03/06/2945347.html
 //http://www.tuicool.com/articles/B7rMZb
 //http://ios.jobbole.com/81864/  (优秀)
 //官方文档 https://developer.apple.com/library/content/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/event_delivery_responder_chain/event_delivery_responder_chain.html#//apple_ref/doc/uid/TP40009541-CH4-SW3
*/

#import "LCQHitTestButton.h"
@interface LCQHitTestButton()
//贝塞尔曲线
@property(nonatomic,strong) UIBezierPath *path;
@end

@implementation LCQHitTestButton

//overide drawRect:
-(void)drawRect:(CGRect)rect{
    
    //BezierPath1
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor blueColor] setStroke];
    [rectanglePath stroke];
    
    //BezierPath2
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    self.path = starPath;
    [starPath moveToPoint: CGPointMake(0, 20)];
    [starPath addLineToPoint: CGPointMake(64, 0)];
    [starPath addLineToPoint: CGPointMake(100, 58)];
    [starPath addLineToPoint: CGPointMake(39, 100)];
    [starPath addLineToPoint: CGPointMake(0, 60)];
    [starPath addLineToPoint: CGPointMake(0, 20)];
    [starPath closePath];
    [[UIColor redColor] setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];
    
}

//overide hitTest:
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
    
}

//overide pointInside:
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    if ([self.path containsPoint:point]) {
        return YES;
    }else{
        return NO;
    }
}

@end
