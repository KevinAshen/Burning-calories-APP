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
#import "BCLSportsDietaryAddSportsListPickerView.h"
#import "BCLSportsDietaryAddSportsListTagView.h"
#import "BCLSportsDietaryAddSportsBounceView.h"
#import <Masonry.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kTitleHeight = 30;

static const NSInteger kTitleInterval = 30;

static NSString *kAddSportCellIdentifier = @"addSportsCell";

@interface BCLSportsDietaryAddSportsListView ()<UITableViewDataSource>

//增加运动tableViewHeadView
@property (nonatomic, strong) BCLSportsDietaryRecordSportsHeadView *sportsDietaryRecordSportsHeadView;
//设定运动View
@property (nonatomic, strong) BCLSportsDietaryAddSportsListPickerView *sportsDietaryAddSportsListPickerView;
//弹起View
@property (nonatomic, strong) BCLSportsDietaryAddSportsBounceView *sportsDietaryAddSportsBounceView;

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
    [self setupAddSportsTableView];
    //[self setupSportsDietaryAddSportsListPickerView];
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
    
    [_addSportsTableView registerClass:[BCLSportsDietaryAddSportsListTableViewCell class] forCellReuseIdentifier:kAddSportCellIdentifier];
    _addSportsTableView.backgroundColor = [UIColor clearColor];
    _addSportsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _addSportsTableView.showsVerticalScrollIndicator = NO;
    _addSportsTableView.showsHorizontalScrollIndicator = NO;
    _addSportsTableView.bounces = NO;
    _addSportsTableView.dataSource = self;
    
    [self setupSportsDietaryRecordSportsHeadView];
    _addSportsTableView.tableHeaderView = _sportsDietaryRecordSportsHeadView;
}

#pragma mark - 传出运动tableView
- (UITableView *)getAddSportsTableView {
    return _addSportsTableView;
}

#pragma mark - UITableViewDataSource实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _sportsDietaryAddSportsListTableViewCell = [tableView dequeueReusableCellWithIdentifier:kAddSportCellIdentifier forIndexPath:indexPath];
    _sportsDietaryAddSportsListTableViewCell.backgroundColor = [UIColor clearColor];
    _sportsDietaryAddSportsListTableViewCell.selectionStyle = UIAccessibilityTraitNone;
    
    _sportsDietaryAddSportsListTableViewCell.sportsDietaryAddSportsLeftListTagView.addButtonAction = ^(UIButton * _Nonnull sender) {
        [self cellAddButtonClick:sender];
    };
    
    return _sportsDietaryAddSportsListTableViewCell;
}

#pragma mark - addButton点击事件
- (void)cellAddButtonClick:(UIButton *)button {
    self.sportsDietaryAddSportsBounceView = [[BCLSportsDietaryAddSportsBounceView alloc] init];
    [_sportsDietaryAddSportsBounceView showInView:self];
}

#pragma mark - 设定运动PickerView
- (void)setupSportsDietaryAddSportsListPickerView {
    _sportsDietaryAddSportsListPickerView = [[BCLSportsDietaryAddSportsListPickerView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight)];
    [self addSubview:_sportsDietaryAddSportsListPickerView];
}

#pragma mark - 得到cell中的tagView
- (BCLSportsDietaryAddSportsListTagView *)getSportsDietaryAddSportsListTableViewTagView {
    return [self.sportsDietaryAddSportsListTableViewCell getTagView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
