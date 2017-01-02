//
//  LittleTestsViewController.m
//  DemosAll
//
//  Created by 李长青 on 2016/12/2.
//  Copyright © 2016年 李长青. All rights reserved.
//

#import "LittleTestsViewController.h"


@interface LittleTestsViewController ()

//1.Test atomic is not safe
@property (atomic, assign)    int intA;
@property (atomic, copy) NSString* stringA;

//2.Test Bounds View
@property(nonatomic,strong) UIView *testBoundsView;
@end

@implementation LittleTestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.opaque = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //2.bounds-Test
    [self testBounds];
    
    return;
    //1.Test atomic is not safe
    [self detachTwoThreadToTestAtomic];
    

}


#pragma mark 1.Test atomic is not safe
-(void)detachTwoThreadToTestAtomic{
    
    //多线程不安全场景之一
//    2016-12-02 16:35:27.089 DemosAll[31548:578971] Thread A: 19995
//    2016-12-02 16:35:27.089 DemosAll[31548:578972] Thread B: 19996
//    2016-12-02 16:35:27.089 DemosAll[31548:578971] Thread A: 19997
//    2016-12-02 16:35:27.090 DemosAll[31548:578971] Thread A: 19998
    [NSThread detachNewThreadWithBlock:^{
        //thread A
        for (int i = 0; i < 10000; i ++) {
            self.intA = self.intA + 1;
            NSLog(@"Thread A: %d\n", self.intA);
        }
    }];
    
    [NSThread detachNewThreadWithBlock:^{
        //thread B
        for (int i = 0; i < 10000; i ++) {
            self.intA = self.intA + 1;
            NSLog(@"Thread B: %d\n", self.intA);
        }
    }];
    sleep(10);
    
    [NSThread detachNewThreadWithBlock:^{
        //thread A
        for (int i = 0; i < 100000; i ++) {
            if (i % 2 == 0) {
                self.stringA = @"a very long string";
            }
            else {
                self.stringA = @"string";
            }
            NSLog(@"Thread A: %@\n", self.stringA);
        }
    }];
    [NSThread detachNewThreadWithBlock:^{
        //thread B
        for (int i = 0; i < 100000; i ++) {
            if (self.stringA.length >= 10) {
                NSString* subStr = [self.stringA substringWithRange:NSMakeRange(0, 10)];
            }
            NSLog(@"Thread B: %@\n", self.stringA);
        }
    }];
    //多线程不安全场景之二
//    - (void)setUserName:(NSString *)userName {
//        if(_uesrName != userName) {
//            [userName retain];
//            [_userName release];
//            _userName = userName;
//        }
//    }
//    不仅仅是赋值操作，还会有retain，release调用。如果property为nonatomic，上述的setter方法就不是原子操作，我们可以假设一种场景，线程1先通过getter获取当前_userName，之后线程2通过setter调用[_userName release];，线程1所持有的_userName就变成无效的地址空间了，如果再给这个地址空间发消息就会导致crash，出现多线程不安全的场景。
//
    
/*
 Property多线程安全小结：
 简而言之，atomic的作用只是给getter和setter加了个锁，atomic只能保证代码进入getter或者setter函数内部时是安全的，一旦出了getter和setter，多线程安全只能靠程序员自己保障了。所以atomic属性和使用property的多线程安全并没什么直接的联系。另外，atomic由于加锁也会带来一些性能损耗，所以我们在编写iOS代码的时候，一般声明property为nonatomic，在需要做多线程安全的场景，自己去额外加锁做同步。
 */
}

#pragma mark 2.Test Bounds
-(void)testBounds{
    
    /*
     1.On the screen, the bounds rectangle represents the same visible portion of the view as its frame rectangle. By default, the origin of the bounds rectangle is set to (0, 0) but you can change this value to display different portions of the view.
     
     2.bounds:The size of the bounds rectangle is coupled to the size of the frame rectangle, so that changes to one affect the other. Changing the bounds size grows or shrinks the view relative to its center point. The coordinates of the bounds rectangle are always specified in points.
     */
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0 ,0, 100 , 100)];
    view1.backgroundColor = [UIColor purpleColor];
    [view addSubview:view1];
    self.testBoundsView = view;
    
    UIControl *btn1 = [[UIControl alloc]initWithFrame:CGRectMake(100, 300, 50, 50)];
    [btn1 setBackgroundColor:[UIColor yellowColor]];
    [btn1 addTarget:self action:@selector(btnclick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIControl *btn2 = [[UIControl alloc]initWithFrame:CGRectMake(200, 300, 50, 50)];
    [btn2 setBackgroundColor:[UIColor orangeColor]];
    [btn2 addTarget:self action:@selector(btnclick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}
-(void)btnclick1{
    
    self.testBoundsView.bounds = CGRectMake(-50, -50, 200, 200);
}
-(void)btnclick2{
    
    if (self.testBoundsView.bounds.size.width == 300) {
        self.testBoundsView.bounds = CGRectMake(0, 0, 200, 200);
    }else{
        self.testBoundsView.bounds = CGRectMake(0, 0, 300, 300);
    }
}

@end
