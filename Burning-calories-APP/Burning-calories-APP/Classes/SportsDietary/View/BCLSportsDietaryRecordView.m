//
//  BCLSportsDietaryRecordView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordView.h"
#import "BCLSportsDietaryRecordSportsTableViewCell.h"
#import "BCLSportsDietaryRecordSportsHeadView.h"
#import "BCLSportsDietaryRecordSportsBottomView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kSegmentedControlHeight = 30;
static const NSInteger kTitleHeight = 30;
static const NSInteger kCellHeight = 75;
static const NSInteger kAddHeight = 45;

static const NSInteger kTitleInterval = 30;
static const NSInteger kCellInterval = 15;
static const NSInteger kAddInterval = 45;
static const NSInteger kBottomInterval = 60;

static NSString *kSportsCellIdentifier = @"sportsCell";

@interface BCLSportsDietaryRecordView()<UITableViewDataSource>

//饮食与健康分段控制器
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
//背景板
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
//运动tableView
@property (nonatomic, strong) UITableView *sportsTableView;
//运动tableViewHeadView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsHeadView *sportsDietaryRecordSportsHeadView;
//运动tableViewBottomView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsBottomView *sportsDietaryRecordSportsBottomView;
//饮食tableView
@property (nonatomic, strong) UITableView *dietaryTableView;

//运动数目
@property (nonatomic, assign) NSInteger sportsNumber;
//背景画布即运动列表高度
@property (nonatomic, assign) NSInteger backgroundScrollViewHeight;

@end

@implementation BCLSportsDietaryRecordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self programmingTest];
        [self calculateUpdateBackgroundScrollViewHeight];
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    [self setupSegmentedControl];
    [self setupBackgroundScrollView];
    [self setupSportsTableView];
    [self setupDietaryTableView];
}

#pragma mark - 分栏设置
- (void)setupSegmentedControl {
    NSArray *segmentedControlArray = @[@"运动", @"饮食"];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedControlArray];
    _segmentedControl.frame = CGRectMake(0, 0, kDeviceWidth, kSegmentedControlHeight);
    _segmentedControl.selectedSegmentIndex = 0;
    
    // 设置文字样式
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]} forState:UIControlStateNormal]; //正常
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateHighlighted]; //按下
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.95f green:0.38f blue:0.22f alpha:1.00f]} forState:UIControlStateSelected]; //选中
    
    // 设置背景图
    [_segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 设置分割线图
    [_segmentedControl setDividerImage:[UIImage new] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];//
    [_segmentedControl setDividerImage:[UIImage new] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
//    _segmentedControl.tintColor = [UIColor clearColor];
//    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
//                                     forState:UIControlStateNormal];
//    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
//                                     forState:UIControlStateSelected];
//    [_segmentedControl setBackgroundColor:[UIColor whiteColor]];
//    [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"bcl_ic_soprts_segmentedControl_bottomSelected"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self addSubview:_segmentedControl];
}

#pragma mark - 背景画布设置
- (void)setupBackgroundScrollView {
    _backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kSegmentedControlHeight, kDeviceWidth, _backgroundScrollViewHeight)];
    [self addSubview:_backgroundScrollView];
    
    _backgroundScrollView.backgroundColor = [UIColor colorWithRed:0.93f green:0.31f blue:0.17f alpha:1.00f];
    _backgroundScrollView.contentSize = CGSizeMake(kDeviceWidth * 2, _backgroundScrollViewHeight);
    _backgroundScrollView.bounces = NO;
    _backgroundScrollView.pagingEnabled = YES;
    _backgroundScrollView.bouncesZoom = NO;
    _backgroundScrollView.showsHorizontalScrollIndicator = NO;
    _backgroundScrollView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark - 运动tableViewHeadView设置
- (void)setupSportsDietaryRecordSportsHeadView {
    _sportsDietaryRecordSportsHeadView = [[BCLSportsDietaryRecordSportsHeadView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kTitleInterval + kTitleHeight)];
    //!!!TEST!!!
    [_sportsDietaryRecordSportsHeadView reloadSportsTotalCalorieNumber:119];
}

#pragma mark - 运动tableViewBottomView设置
- (void)setupSportsDietaryRecordSportsBottomView {
    _sportsDietaryRecordSportsBottomView = [[BCLSportsDietaryRecordSportsBottomView alloc] initWithFrame:CGRectMake(0, _backgroundScrollViewHeight - kBottomInterval - kAddHeight, kDeviceWidth, kAddHeight)];
}

#pragma mark - 运动tableView设置
- (void)setupSportsTableView {
    _sportsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, _backgroundScrollViewHeight - 64) style:UITableViewStyleGrouped];
    [self.backgroundScrollView addSubview:_sportsTableView];
    
    _sportsTableView.tag = 1;
    [_sportsTableView registerClass:[BCLSportsDietaryRecordSportsTableViewCell class] forCellReuseIdentifier:kSportsCellIdentifier];
    _sportsTableView.backgroundColor = [UIColor clearColor];
    _sportsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sportsTableView.showsVerticalScrollIndicator = NO;
    _sportsTableView.showsHorizontalScrollIndicator = NO;
    _sportsTableView.bounces = NO;
    _sportsTableView.dataSource = self;
    
    [self setupSportsDietaryRecordSportsHeadView];
    _sportsTableView.tableHeaderView = _sportsDietaryRecordSportsHeadView;
    [self setupSportsDietaryRecordSportsBottomView];
    _sportsTableView.tableFooterView = _sportsDietaryRecordSportsBottomView;
}

#pragma mark - 饮食tableView设置
- (void)setupDietaryTableView {
    _dietaryTableView = [[UITableView alloc] initWithFrame:CGRectMake(kDeviceWidth, 0, kDeviceWidth, _backgroundScrollViewHeight) style:UITableViewStyleGrouped];
    [self.backgroundScrollView addSubview:_dietaryTableView];
    
    _dietaryTableView.tag = 2;
    [_dietaryTableView registerClass:[BCLSportsDietaryRecordSportsTableViewCell class] forCellReuseIdentifier:kSportsCellIdentifier];
    _dietaryTableView.backgroundColor = [UIColor clearColor];
    _dietaryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dietaryTableView.showsVerticalScrollIndicator = NO;
    _dietaryTableView.showsHorizontalScrollIndicator = NO;
    _dietaryTableView.bounces = NO;
    _dietaryTableView.dataSource = self;
}

#pragma mark - UITableViewDataSource实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 1) {
        return _sportsNumber;
    } else {
        return 8;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return 1;
    } else {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        BCLSportsDietaryRecordSportsTableViewCell *sportsDietaryRecordSportsTableViewCell = [tableView dequeueReusableCellWithIdentifier:kSportsCellIdentifier forIndexPath:indexPath];
        sportsDietaryRecordSportsTableViewCell.backgroundColor = [UIColor clearColor];
        sportsDietaryRecordSportsTableViewCell.selectionStyle = UIAccessibilityTraitNone;
        return sportsDietaryRecordSportsTableViewCell;
    } else {
        BCLSportsDietaryRecordSportsTableViewCell *sportsDietaryRecordSportsTableViewCell = [tableView dequeueReusableCellWithIdentifier:kSportsCellIdentifier forIndexPath:indexPath];
        sportsDietaryRecordSportsTableViewCell.backgroundColor = [UIColor clearColor];
        sportsDietaryRecordSportsTableViewCell.selectionStyle = UIAccessibilityTraitNone;
        return sportsDietaryRecordSportsTableViewCell;
    }
}

#pragma mark - 传出背景scrollView
- (UIScrollView *)getBackgroundScrollView {
    return _backgroundScrollView;
}

#pragma mark - 传出运动tableView
- (UITableView *)getSportsTableView {
    return _sportsTableView;
}

#pragma mark - 计算背景画布即运动tableView高度并更新View的高度
- (void)calculateUpdateBackgroundScrollViewHeight {
    NSInteger backgroundScrollViewHeight = kTitleHeight + kTitleInterval + kAddHeight + kAddInterval + (kCellHeight + kCellInterval) * _sportsNumber + kBottomInterval;
    _backgroundScrollViewHeight = backgroundScrollViewHeight;
    [self setFrame:CGRectMake(0, 64, kDeviceWidth * 2, _backgroundScrollViewHeight + kSegmentedControlHeight)];
}

#pragma mark - 测试数据填充
- (void)programmingTest {
    _sportsNumber = 8;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
