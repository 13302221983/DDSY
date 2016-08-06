//
//  UIMyMessageViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/3/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIMyMessageViewController.h"
#import "UIMessageTableViewCell.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "TestLoad.h"

@interface UIMyMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UIMyMessageViewController{
    UITableView *_tableView;
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"我的信息";
#ifdef TEST_VERSION
    _dataArray = [TestLoad messageData];
#endif
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIMyMessageTableViewCell"];
    if (nil == cell) {
        cell = [[UIMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UIMyMessageTableViewCell"];
    }
    
    NSDictionary *msgDict = [_dataArray objectAtIndex:indexPath.row];
    NSString *dateTime = [msgDict objectForKey:@"time"];
    NSString *content = [msgDict objectForKey:@"content"];
    
    [cell.textLabel setText:dateTime?dateTime:@""];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"  %@",content?content:@""]];
    [cell.detailTextLabel setFont:[MdFont defaultFont].contentFont];
    [cell.detailTextLabel setTextColor:[MdColor defaultColor].contentColor];
    
    
    return cell;
}

@end
