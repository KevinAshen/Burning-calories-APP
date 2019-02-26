//
//  BCLSportsDietaryViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryViewController.h"
#import "BCLSportsDietaryRecordView.h"
#import "BCLSportsDietaryRecordDietaryTableViewSectionView.h"
#import "BCLSportsDietaryRecordSportsBottomView.h"
#import "BCLSportsDietaryAddSportsListViewController.h"

static const NSInteger kSegmentedControlHeight = 30;
static const NSInteger kTitleHeight = 30;
static const NSInteger kCellHeight = 75;
static const NSInteger kSectionHeight = 70;
static const NSInteger kAddHeight = 45;

static const NSInteger kTitleInterval = 30;
static const NSInteger kCellInterval = 15;
static const NSInteger kAddInterval = 45;
static const NSInteger kBottomInterval = 60;

@interface BCLSportsDietaryViewController ()<UIScrollViewDelegate, UITableViewDelegate, BCLSportsDietaryRecordSportsBottomViewDelegate>

//上半部分的分段控制器与饮食+健康的tableView
@property (nonatomic, strong) BCLSportsDietaryRecordView *sportsDietaryRecordView;

//增加运动ViewController
@property (nonatomic, strong) BCLSportsDietaryAddSportsListViewController *sportsDietaryAddSportsListViewController;

@end

@implementation BCLSportsDietaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigation];
    [self setupSubview];
}

#pragma mark - 子视图设置
- (void)setupSubview {
    [self setupSportsDietaryRecordView];
}

#pragma mark - Navigation的设置
- (void)setupNavigation {
    self.navigationItem.title = @"饮食与健康";
}

#pragma mark - 上半部分SportsDietaryRecordView的设置
- (void)setupSportsDietaryRecordView {
    _sportsDietaryRecordView = [[BCLSportsDietaryRecordView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, 30)];  //30为虚值， 里面再替换
    [self.view addSubview:_sportsDietaryRecordView];
    
    [_sportsDietaryRecordView getBackgroundScrollView].delegate = self;
    [_sportsDietaryRecordView getSportsTableView].delegate = self;
    [_sportsDietaryRecordView getDietaryTableView].delegate = self;
    _sportsDietaryRecordView.sportsDietaryRecordSportsBottomView.sportsDietaryRecordSportsBottomViewDelegate = self;
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //!!!TEST!!!
    return 75;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth - 36 - 36, 15)];
        headView.backgroundColor = [UIColor clearColor];
        return headView;
    } else {
        BCLSportsDietaryRecordDietaryTableViewSectionView *sportsDietaryRecordDietaryTableViewSectionView = [[BCLSportsDietaryRecordDietaryTableViewSectionView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kSectionHeight)];
        return sportsDietaryRecordDietaryTableViewSectionView;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - UIScrollViewDelegate实现
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:[UITableView class]]) {
        //NSLog(@"------是列表---");
    } else {
        NSInteger x = scrollView.contentOffset.x;
        if (x == 0) {
            [_sportsDietaryRecordView updateSegmentedControlIndexWithIndexNumber:0];
        } else if (x == 414) {
            [_sportsDietaryRecordView updateSegmentedControlIndexWithIndexNumber:1];
        }
    }
}

#pragma mark - BCLSportsDietaryRecordSportsBottomViewDelegate实现
- (void)addSportsSkip {
    _sportsDietaryAddSportsListViewController = [[BCLSportsDietaryAddSportsListViewController alloc] init];
    [self.navigationController pushViewController:_sportsDietaryAddSportsListViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
