//
//  BCLSportsDietaryAddSportsListView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/2/26.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListView.h"
#import "BCLSportsDietaryRecordSportsHeadView.h"
#import "BCLSportsDietaryAddSportsListTableViewCell.h"

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

static NSString *kAddSportCellIdentifier = @"addSportsCell";

@interface BCLSportsDietaryAddSportsListView ()<UITableViewDataSource>

//增加运动tableView
@property (nonatomic, strong) UITableView *addSportsTableView;
//增加运动tableViewHeadView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsHeadView *sportsDietaryRecordSportsHeadView;

@end

@implementation BCLSportsDietaryAddSportsListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    self.backgroundColor = [UIColor colorWithRed:0.93f green:0.31f blue:0.17f alpha:1.00f];
}

#pragma mark - 增加运动tableViewHeadView设置
- (void)setupSportsDietaryRecordSportsHeadView {
    _sportsDietaryRecordSportsHeadView = [[BCLSportsDietaryRecordSportsHeadView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kTitleInterval + kTitleHeight)];
    //!!!TEST!!!
    [_sportsDietaryRecordSportsHeadView reloadSportsTotalCalorieNumber:119];
}

#pragma mark - 增加运动tableView设置
- (void)setupAddSportsTableView {
    _addSportsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 64) style:UITableViewStyleGrouped];
    [self addSubview:_addSportsTableView];
    
//    [_addSportsTableView registerClass:[BCLSportsDietaryRecordSportsTableViewCell class] forCellReuseIdentifier:kSportsCellIdentifier];
    _addSportsTableView.backgroundColor = [UIColor clearColor];
    _addSportsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _addSportsTableView.showsVerticalScrollIndicator = NO;
    _addSportsTableView.showsHorizontalScrollIndicator = NO;
    _addSportsTableView.bounces = NO;
    _addSportsTableView.dataSource = self;
    
    [self setupSportsDietaryRecordSportsHeadView];
    _addSportsTableView.tableHeaderView = _sportsDietaryRecordSportsHeadView;
}

#pragma mark - UITableViewDataSource实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    BCLSportsDietaryAddSportsListTableViewCell *sportsDietaryAddSportsListTableViewCell = [tableView dequeueReusableCellWithIdentifier:kSportsCellIdentifier forIndexPath:indexPath];
////    sportsDietaryRecordSportsTableViewCell.backgroundColor = [UIColor clearColor];
////    sportsDietaryRecordSportsTableViewCell.selectionStyle = UIAccessibilityTraitNone;
////    return sportsDietaryRecordSportsTableViewCell;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
