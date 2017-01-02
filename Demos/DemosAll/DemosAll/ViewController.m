//
//  ViewController.m
//  Demo0-HitTest
//
//  Created by 李长青 on 2016/12/1.
//  Copyright © 2016年 李长青. All rights reserved.
//

#import "ViewController.h"
#import "LCQHitTestViewController.h"
#import "LittleTestsViewController.h"


#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

//数据源
@property(nonatomic,strong) NSArray *dataArr;
//TableView
@property(nonatomic,strong) UITableView *tabView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"大家好，这个是我学习创建的Demo";
    
    
    //0.创建TableView
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH , SCREENHIGHT) style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    self.tabView = tableview;
    [self.view addSubview:tableview];
    
    //1.初始化数据源
    NSArray *array = @[@"Demo0-HitTest",@"Demo1-atomic is not safe",@"Bounds",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--",@"--"];
    self.dataArr = array;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        //hitTest
        case 0:{
            LCQHitTestViewController *hitTestVC = [[LCQHitTestViewController alloc] init];
            [self.navigationController pushViewController:hitTestVC animated:YES];
            break;
        }
        case 1:{
            LittleTestsViewController *hitTestVC = [[LittleTestsViewController alloc] init];
            [self.navigationController pushViewController:hitTestVC animated:YES];
            break;
        }
        case 2:{
            LittleTestsViewController *hitTestVC = [[LittleTestsViewController alloc] init];
            [self.navigationController pushViewController:hitTestVC animated:YES];
            break;
        }
            
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
