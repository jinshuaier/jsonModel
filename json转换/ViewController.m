//
//  ViewController.m
//  json转换
//
//  Created by 胡高广 on 2017/11/2.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "ViewController.h"
#import "TCListCell.h"
#import "OrderInfoModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource, TCListCellDelegate>

@property (nonatomic, strong) UITableView    *listTableView;
@property (nonatomic, strong) NSMutableArray *dataMuArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    // 模拟导航
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDHT, 64)];
    nav.backgroundColor = [UIColor blueColor];
    [self.view addSubview:nav];
    // 请求数据
    [self requestData];
    // 初始化表格
    [self initTableView];
}
- (void)requestData{
    
    self.dataMuArr = [NSMutableArray array];
    
    //创建的json数据 （没网假数据,记住加json到文件)
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"hgg" ofType:@"geojson"];
    NSData *jsonData = [NSData dataWithContentsOfFile:strPath options:NSDataReadingMappedIfSafe error:nil];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    //NSLog(@"%@",dic);
    
    NSMutableArray *arr = dic[@"data"];
    for (NSDictionary *infoDic in arr) {
        OrderInfoModel *model = [OrderInfoModel orderInfoWithDictionary:infoDic];
        [self.dataMuArr addObject:model];
    }
    [self.listTableView reloadData];
}
#pragma mark - 表格
- (void)initTableView{
    
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height -64) style:UITableViewStylePlain];
    self.listTableView.backgroundColor = ViewColor;
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    self.listTableView.showsVerticalScrollIndicator = NO;
    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //ios11解决点击刷新跳转的问题
    self.listTableView.estimatedRowHeight = 0;
    self.listTableView.estimatedSectionHeaderHeight = 0;
    self.listTableView.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:self.listTableView];
   
    self.listTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataMuArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return [self.listTableView cellHeightForIndexPath:indexPath model:self.dataMuArr[indexPath.row] keyPath:@"model" cellClass:[TCListCell class] contentViewWidth:[MyTool cellContentViewWith]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TCListCell *cell = [[TCListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataMuArr[indexPath.row];
    
    if (cell.count < 3){
        NSLog(@"不刷新");
    } else {
        cell.delegate = self;
    }
    return cell;
}

- (void)btnClick:(UITableViewCell *)cell{

    NSIndexPath *indexPath = [self.listTableView indexPathForCell:cell];
    NSArray *indexPathAry = @[indexPath];
    [self.listTableView reloadRowsAtIndexPaths:indexPathAry withRowAnimation:UITableViewRowAnimationAutomatic];
    //NSLog(@"刷新单个的一行了");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
