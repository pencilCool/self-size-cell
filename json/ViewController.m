//
//  ViewController.m
//  json
//
//  Created by tangyuhua on 2017/2/22.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "MyData.h"
#import <YYKit.h>
#import <YYKit/NSObject+YYModel.h>
#import <Masonry.h>
#import "MyCell.h"
#import "MyImageCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.dataSource   = [NSArray modelArrayWithClass:[MyData class] json:jsonString];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor greenColor];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:@"mycell"];
    [self.tableView registerClass:[MyImageCell class] forCellReuseIdentifier:@"myImagecell"];
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.fd_debugLogEnabled = YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyData *model = self.dataSource[indexPath.row];
    if (model.images!= nil && model.images.count>0) {
        MyImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myImagecell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }else{
        MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      return self.dataSource.count;
}

//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    MyData *model = self.dataSource[indexPath.row];
//
//    if (model.images!= nil && model.images.count>0) {
//        return [tableView fd_heightForCellWithIdentifier:@"myImagecell"
//                                           configuration:^(MyImageCell *cell) {
//            cell.model = model;
//        }];
//     
//    }else{
//        return [tableView fd_heightForCellWithIdentifier:@"mycell"
//                                           configuration:^(MyCell *cell) {
//            cell.model = model;
//        }];
//    }
//    
//   
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
