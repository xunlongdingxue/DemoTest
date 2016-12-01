//
//  ViewController.m
//  LCQHUDLearn
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "MBProgressHUD.h"


#define NAVBAR_CHANGE_POINT 0
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *backView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    // [self.navigationController.navigationBar nav_setBackgroundColor:[UIColor clearColor]];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 200)];
    [view setImage:[UIImage imageNamed:@"bg.jpg"]];
    self.tableView.tableHeaderView = view;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    // [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //HUD
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.contentColor = [UIColor blackColor];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });

}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    for (UIView *subview in cell.contentView.subviews) {
        [subview removeFromSuperview];
    }
    
    //FLAnimatedImage
    NSString *pathStr = [[NSBundle mainBundle]pathForResource:@"hello" ofType:@"gif"];
    NSURL *firlURl =[NSURL fileURLWithPath:pathStr];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:firlURl]];
    FLAnimatedImageView *gifImageView = [[FLAnimatedImageView alloc] init];
    gifImageView.animatedImage = image;
    gifImageView.runLoopMode = NSDefaultRunLoopMode;
    gifImageView.frame = CGRectMake(0.0, 0.0, 268/1.5/1.5, 100.0/1.5);
    [cell.contentView addSubview:gifImageView];
    
 
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    UIColor *color = [UIColor colorWithRed:0/255.0 green:175/255.0  blue:240/255.0 alpha:1];
    //    CGFloat offsetY = scrollView.contentOffset.y;
    //    if (offsetY > NAVBAR_CHANGE_POINT) {
    //        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
    //        [self.navigationController.navigationBar nav_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    //    } else {
    //        [self.navigationController.navigationBar nav_setBackgroundColor:[color colorWithAlphaComponent:0]];
    //    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
