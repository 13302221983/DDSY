//
//  UILocationSelectViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UILocationSelectViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import "Masonry.h"
#import "UITipView.h"
#import "MdStyle.h"
#import "UIAddOilConfirmViewController.h"

@interface UILocationSelectViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate>

@end

@implementation UILocationSelectViewController{
    BMKMapView *_baiduMapView; /*!< 地图对象 */
    BMKLocationService* _locService;/*!< 定位对象 */
    BMKGeoCodeSearch* _geocodesearch;
    
    UILabel *_locationLabel; /*!< 提示控件 */
    NSString *_address;/*!< 地址 */
}

- (void)dealloc
{
    [_locService stopUserLocationService];
    _baiduMapView.showsUserLocation = NO;
    _baiduMapView = nil;
    _locService = nil;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"地图选点";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshEvent:)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    UIView *tipView = [[UIView alloc] init];
    tipView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(@73);
    }];
    
    //tip
    _locationLabel = [[UILabel alloc] init];
    _locationLabel.numberOfLines = 0;
    [_locationLabel setTextColor:[MdColor defaultColor].contentColor];
    [_locationLabel setFont:[MdFont defaultFont].contentFont];
    [_locationLabel setText:@"正在定位，请稍候..."];
    [tipView addSubview:_locationLabel];
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView).offset(10);
        make.right.equalTo(tipView).offset(-100);
        make.top.equalTo(tipView).offset(5);
        make.bottom.equalTo(tipView).offset(-5);
    }];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [submitBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [submitBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(onSubmitEvent:) forControlEvents:UIControlEventTouchUpInside];
    [tipView addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(tipView).offset(-10);
        make.top.mas_equalTo(@16);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@80);
    }];
    
    //map
    _baiduMapView = [[BMKMapView alloc] init];
    _baiduMapView.mapType = BMKMapTypeStandard;
    _baiduMapView.zoomLevel =15;
    [self.view addSubview:_baiduMapView];
    [_baiduMapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.mas_equalTo(tipView.mas_top);
    }];
    
    [self startLocation];
    
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _geocodesearch.delegate = self;
}


- (void)refreshEvent:(id)sender
{
    [_locationLabel setText:@"正在定位，请稍候..."];
    [self startLocation];
}

- (void)startLocation
{
    _baiduMapView.showsUserLocation = YES;//先关闭显示的定位图层
    _baiduMapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _baiduMapView.showsUserLocation = YES;//显示定位图层
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    
    [_locService startUserLocationService];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_baiduMapView viewWillAppear];
    _baiduMapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [_baiduMapView viewWillDisappear];
    _baiduMapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSubmitEvent:(id)sender
{
    UIAddOilConfirmViewController *vc = [[UIAddOilConfirmViewController alloc] init];
    vc.carInfo = self.carInfo;
    
    if ([_address length] > 0) {
        [vc.dataDict setObject:_address forKey:@"Location"];
    }else{
        [vc.dataDict setObject:@"江西省南昌市西湖区广场东路203号" forKey:@"Location"];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _baiduMapView.centerCoordinate = userLocation.location.coordinate;
        
        [_baiduMapView updateLocationData:userLocation];
    }];
    

    
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = userLocation.location.coordinate;
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}

#pragma mark -设置定位圆点属性
-(void)setUserImage:(BMKUserLocation *)userLocation
{
    //用户位置类
    BMKLocationViewDisplayParam* param = [[BMKLocationViewDisplayParam alloc] init];
    param.locationViewOffsetY = 0;//偏移量
    param.locationViewOffsetX = 0;
    param.isAccuracyCircleShow =NO;//设置是否显示定位的那个精度圈
    param.isRotateAngleValid = NO;
    [_baiduMapView updateLocationViewWithParam:param];
}


/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    [_locationLabel setText:@"定位失败，请在【设置】-【隐私】-【定位服务】中打开油掌柜的定位功能。"];
}


#pragma mark -BMKGeoCodeSearchDelegate
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == 0) {
        NSLog(@"address:%@", result.address);
        [_locationLabel setText:result.address];
        _address = result.address;
    }else{
        [self didFailToLocateUserWithError:nil];
    }

}
@end
