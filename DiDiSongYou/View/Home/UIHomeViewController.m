//
//  UIHomeViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 5/26/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIHomeViewController.h"
#import "UIHomeCollectionViewCell.h"
#import "UIOrderTableViewCell.h"
#import "MdOrder.h"
#import "Masonry.h"
#import "MdStyle.h"

#import "TestLoad.h"

#import "UIImageView+WebCache.h"

#import "UIMyMessageViewController.h"
#import "UIAddOilViewController.h"
#import "MyOrderViewController.h"
#import "UIMyAccountViewController.h"

typedef NS_ENUM(NSInteger, MENU_TYPE){
    MENU_TYPE_JIAYOU = 1,   /*!< 我要加油 */
    MENU_TYPE_DINGDAN = 2,  /*!< 我的订单 */
    MENU_TYPE_ZHANGHU = 3,  /*!< 我的帐户 */
    MENU_TYPE_XINXI = 4,    /*!< 我的信息 */
};

@interface UIHomeViewController ()<UICollectionViewDelegate,
    UICollectionViewDataSource,
    UITableViewDataSource,
    UITableViewDelegate>

@end

@implementation UIHomeViewController{
    NSArray *_menuArray;/*!< 菜单列表 */
    NSArray *_dataList;/*!< 订单列表 */
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"homemenu" ofType:@"plist"];
        _menuArray = [NSArray arrayWithContentsOfFile:filePath];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
#ifdef TEST_VERSION
    _dataList = [TestLoad OrderData];
#endif
    
    //ad view
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    UIImage *adImage = [UIImage imageNamed:@"Advertisement"];
    [imageView setImage:adImage];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@143);
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
    //menu
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView *menuView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    menuView.backgroundColor = [UIColor yellowColor];
    menuView.dataSource = self;
    menuView.delegate = self;
    //注册Cell，必须要有
    [menuView registerClass:[UIHomeCollectionViewCell class] forCellWithReuseIdentifier:@"UIHomeCollectionViewCell"];
    
    [self.view addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.top.equalTo(imageView.mas_bottom).offset(6);
        make.height.mas_equalTo(@180);
    }];
    
    
    //title
    UILabel *titleLabelView = [[UILabel alloc] init];
    [titleLabelView setText:@"订单跟踪"];
    [titleLabelView setTextColor:[UIColor blackColor]];
    [titleLabelView setFont:[UIFont boldSystemFontOfSize:14]];
    [self.view addSubview:titleLabelView];
    [titleLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@4);
        make.right.equalTo(self.view).offset(-4);
        make.top.equalTo(menuView.mas_bottom).offset(6);
        make.height.mas_equalTo(@26);
    }];
    
    //list
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabelView.mas_bottom).offset(4);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super.navigationController setNavigationBarHidden:YES animated:TRUE];
    [super.navigationController setToolbarHidden:YES animated:TRUE];
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

- (NSArray*)loadMenus
{
    NSString *menuFile = [[NSBundle mainBundle] pathForResource:@"homemenu" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:menuFile];
    return array;
}

#pragma mark -UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_menuArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIHomeCollectionViewCell *cview = [collectionView dequeueReusableCellWithReuseIdentifier:@"UIHomeCollectionViewCell" forIndexPath:indexPath];
    
    NSDictionary *dict = [_menuArray objectAtIndex:indexPath.row];
    UIColor *bkgColor = [UIColor coloWithHex:[dict objectForKey:@"backgroundColor"]];
    cview.backgroundColor = bkgColor;

    cview.titleLabel.text = [dict objectForKey:@"title"];
    [cview.titleLabel setTextColor:[MdColor defaultColor].menuColor];
    
    return cview;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((self.view.bounds.size.width-16-5)/2, 88);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIOrderTableViewCell *cell = (UIOrderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"UIOrderTableViewCell"];
    if (nil == cell) {
        cell = [[UIOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UIOrderTableViewCell"];
    }
    
    MdOrder *order = [_dataList objectAtIndex:indexPath.row];
    
    [cell.stateLabel setText:[NSString stringWithFormat:@"订单状态：%@",order.state]];
    [cell.codeLabel setText:[NSString stringWithFormat:@"订单编号：%@",order.code]];
    [cell.carLabel setText:[NSString stringWithFormat:@"订单车辆：%@",order.car]];
    [cell.timeLabel setText:order.dateTime];
    
    if([order.image hasPrefix:@"http"]){
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:order.image] placeholderImage:[UIImage imageNamed:@"defaultcar.png"]];
    }else{
        [cell.imageView setImage:[UIImage imageNamed:order.image]];
    }
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *menuInfo = [_menuArray objectAtIndex:indexPath.row];
    NSInteger menuId = [[menuInfo objectForKey:@"id"] integerValue];
    switch (menuId) {
        case MENU_TYPE_JIAYOU:
        {
            UIAddOilViewController *jyVC = [[UIAddOilViewController alloc] init];
            [self.navigationController pushViewController:jyVC animated:YES];
        }
            break;
        case MENU_TYPE_XINXI:
        {
            UIMyMessageViewController *myMsgVC = [[UIMyMessageViewController alloc] init];
            [self.navigationController pushViewController:myMsgVC animated:YES];
        }
            break;
        case MENU_TYPE_DINGDAN:
        {
            MyOrderViewController *orderVC = [[MyOrderViewController alloc] init];
            [self.navigationController pushViewController:orderVC animated:YES];
        }
            break;
        case MENU_TYPE_ZHANGHU:
        {
            UIMyAccountViewController *accountVC = [[UIMyAccountViewController alloc] init];
            [self.navigationController pushViewController:accountVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
