//
//  ViewController.m
//  HelloWorld
//
//  Created by pioneer on 16/6/23.
//  Copyright © 2016年 pioneer. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"
@interface ViewController ()<UITableViewDataSource>
@property (strong, nonatomic) UITableView *myTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.myTable];
}
#pragma mark 懒加载

-(UITableView *)myTable
{
    if(!_myTable){
        _myTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTable.tableFooterView = [UIView new];
        [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _myTable.dataSource = self;
        
    }
    return _myTable;
}
#pragma mark 自动布局
- (void)viewWillLayoutSubviews
{
    _myTable.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
}
#pragma mark 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @"Hello world";
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
