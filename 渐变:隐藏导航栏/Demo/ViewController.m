//
//  ViewController.m
//  Demo
//
//  Created by 汪文斌 on 2017/1/8.
//  Copyright © 2017年 Maximuum. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+MAXNavigationBar.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self _interfaceTableView];
    [self _customNavigationView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat _offset = scrollView.contentOffset.y;
    NSLog(@"%f", _offset);
    if (_offset > 0) {
        if (_offset >= 64) {
            self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(self.view.bounds));
            [self.navigationController.navigationBar max_setNavigationBarOffsetY:-64];
            [self.navigationController.navigationBar max_setContentViewAlpha:0];
        } else {
            self.tableView.frame = CGRectMake(0, 64-_offset, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(self.view.bounds)+(64-_offset));
            [self.navigationController.navigationBar max_setNavigationBarOffsetY:-_offset];
            [self.navigationController.navigationBar max_setContentViewAlpha:1-_offset/44.0];
            
        }
    } else {
        [self.navigationController.navigationBar max_setNavigationBarOffsetY:1];
        [self.navigationController.navigationBar max_setContentViewAlpha:1];
        self.tableView.frame = CGRectMake(0, 64, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(self.view.bounds)-64);
    }
}

#pragma mark - interface 
- (void)_interfaceTableView {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10);
    view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 50;
    _tableView.rowHeight = 50;
    _tableView.tableFooterView = view;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.view addSubview:_tableView];
}

- (void)_customNavigationView {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationItem.leftBarButtonItem = item;
}

@end




























