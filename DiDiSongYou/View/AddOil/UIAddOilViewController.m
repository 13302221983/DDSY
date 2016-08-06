//
//  UIAddOilViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIAddOilViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "MdCarInfo.h"
#import "UIImageView+WebCache.h"
#import "TestLoad.h"
#import "UICarListTableViewCell.h"
#import "UILocationSelectViewController.h"

@interface UIAddOilViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation UIAddOilViewController{
    UITableView *_carListTableView; /*!< 车列表 */
    NSArray *_dataListArray; /*!< 车数据列表 */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.navigationItem.title = @"我要加油";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataListArray = [TestLoad carData];
    

    _carListTableView = [[UITableView alloc] init];
    _carListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _carListTableView.delegate = self;
    _carListTableView.dataSource = self;
    [self.view addSubview:_carListTableView];
    [_carListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UICarListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carSelectTableViewCell"];
    if (nil == cell) {
        cell = [[UICarListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"carSelectTableViewCell"];
    }
    
    MdCarInfo *car = [_dataListArray objectAtIndex:indexPath.row];
    
    NSString *title = [NSString stringWithFormat:@"车牌号：%@", car.number];
    NSString *detail = [NSString stringWithFormat:@"加油卡号：%@", car.oilCard];
    
    if ([car.image hasPrefix:@"http"]) {
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:car.image] placeholderImage:[UIImage imageNamed:@"car"]];
    }else{
        [cell.imageView setImage:[UIImage imageNamed:car.image]];
    }
    
    
    [cell.textLabel setText:title];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    
    [cell.detailTextLabel setText:detail];
    [cell.detailTextLabel setTextColor:[MdColor defaultColor].contentColor];
    [cell.detailTextLabel setFont:[MdFont defaultFont].contentFont];
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MdCarInfo *car = [_dataListArray objectAtIndex:indexPath.row];
    UILocationSelectViewController *locationVC = [[UILocationSelectViewController alloc] init];
    locationVC.carInfo = car;
    [self.navigationController pushViewController:locationVC animated:YES];
}
@end
