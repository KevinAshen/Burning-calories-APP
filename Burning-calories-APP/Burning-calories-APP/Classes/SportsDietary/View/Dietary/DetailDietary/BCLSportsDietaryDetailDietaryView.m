//
//  BCLSportsDietaryDetailDietaryView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/17.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryDetailDietaryView.h"
#import "BCLSportsDietaryRecordSportsHeadView.h"
#import "BCLSportsDietaryAddSportsListTableViewCell.h"
#include <Masonry.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kViewLeftOrRightInterval = 36;

static const NSInteger kDetailDietaryHeadViewHeight = 60;
static const NSInteger kDetailDietaryTableViewHeadViewHeight = 120;

static NSString *kDetailDietaryCellIdentifier = @"detailDietaryCell";

@interface BCLSportsDietaryDetailDietaryView ()<UITableViewDataSource>

//卡路里统计HeadView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsHeadView *detailDietaryHeadView;
//食谱TableViewHeadView
@property (nonatomic, strong) UIView *detailDietaryTableViewHeadView;
//食谱TableView
@property (nonatomic, strong) UITableView *detailDietaryTableView;

@end

@implementation BCLSportsDietaryDetailDietaryView

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
    [self setupDetailDietaryHeadView];
    [self setupDetailDietaryTableView];
}

#pragma mark - DetailDietaryHeadView设置
- (void)setupDetailDietaryHeadView {
    self.detailDietaryHeadView = [[BCLSportsDietaryRecordSportsHeadView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDetailDietaryHeadViewHeight)];
    [self addSubview:_detailDietaryHeadView];
    
    //!!!TEST!!!
    [_detailDietaryHeadView reloadSportsTotalCalorieNumber:119];
}

#pragma mark - 食谱TableView设置
- (void)setupDetailDietaryTableView {
    //食谱TableViewHeadView创建
//    UIImageView *detailDietaryTableViewHeadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_dietary_detailDietary_testDietaryImage"]];
//    detailDietaryTableViewHeadImageView.frame = CGRectMake(kViewLeftOrRightInterval, 0, kDeviceWidth - 2 * kViewLeftOrRightInterval, kDetailDietaryTableViewHeadViewHeight);
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(kViewLeftOrRightInterval, 0, kDeviceWidth - 2 * kViewLeftOrRightInterval, kDetailDietaryTableViewHeadViewHeight)];
    backgroundView.backgroundColor = [UIColor clearColor];
    UIImageView *detailDietaryTableViewHeadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_dietary_detailDietary_testDietaryImage"]];
    detailDietaryTableViewHeadImageView.frame = CGRectMake(kViewLeftOrRightInterval, 0, kDeviceWidth - 2 * kViewLeftOrRightInterval, kDetailDietaryTableViewHeadViewHeight);
    [backgroundView addSubview:detailDietaryTableViewHeadImageView];
    
    _detailDietaryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kDetailDietaryHeadViewHeight + 64, kDeviceWidth, kDeviceHeight - 64 - kDetailDietaryHeadViewHeight) style:UITableViewStyleGrouped];
    [self addSubview:_detailDietaryTableView];
    
    _detailDietaryTableView.tableHeaderView = backgroundView;
    
    [_detailDietaryTableView registerClass:[BCLSportsDietaryAddSportsListTableViewCell class] forCellReuseIdentifier:kDetailDietaryCellIdentifier];
    _detailDietaryTableView.backgroundColor = [UIColor clearColor];
    _detailDietaryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _detailDietaryTableView.showsVerticalScrollIndicator = NO;
    _detailDietaryTableView.showsHorizontalScrollIndicator = NO;
    _detailDietaryTableView.bounces = NO;
    _detailDietaryTableView.dataSource = self;
}

#pragma mark - 传出食谱TableView
- (UITableView *)getDetailDietaryTableView {
    return _detailDietaryTableView;
}

#pragma mark - UITableViewDataSource实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BCLSportsDietaryAddSportsListTableViewCell *detailDietaryTableViewTableViewCell = [tableView dequeueReusableCellWithIdentifier:kDetailDietaryCellIdentifier forIndexPath:indexPath];
    detailDietaryTableViewTableViewCell.backgroundColor = [UIColor clearColor];
    detailDietaryTableViewTableViewCell.selectionStyle = UIAccessibilityTraitNone;
    return detailDietaryTableViewTableViewCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
