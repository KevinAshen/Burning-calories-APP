//
//  BCLWeekTimeRecordView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/31.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLWeekTimeRecordView.h"
#import "BCLWeekTimeRecordCollectionViewCell.h"
#import "BCLOtherWeekDayRecordCollectionViewCell.h"

static NSString *const weekCellName = @"weekCell";
static NSString *const otherWeekDayCellName = @"otherWeekDayCell";

@interface BCLWeekTimeRecordView ()<UICollectionViewDataSource>

@property (nonatomic, assign)BOOL loveBtnSelected;
@end
@implementation BCLWeekTimeRecordView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.itemSize = CGSizeMake(300, 200);
        
        _weekLogCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _weekLogCollectionView.dataSource = self;
        _weekLogCollectionView.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
        
        [_weekLogCollectionView registerClass:[BCLWeekTimeRecordCollectionViewCell class] forCellWithReuseIdentifier:weekCellName];
        [_weekLogCollectionView registerClass:[BCLOtherWeekDayRecordCollectionViewCell class] forCellWithReuseIdentifier:otherWeekDayCellName];
        [self addSubview:_weekLogCollectionView];
        
        _loveBtnSelected = false;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    }
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        BCLWeekTimeRecordCollectionViewCell *weekCell = [_weekLogCollectionView dequeueReusableCellWithReuseIdentifier:weekCellName forIndexPath:indexPath];
        
        weekCell.backgroundColor = [UIColor whiteColor];
        weekCell.weekFoodImageView.image = [UIImage imageNamed:@"bcl_bg_log_everyday_food1"];
        weekCell.everydayCaloriesLabel.text = @"1778千卡";
        weekCell.loveButtonAction = ^(UIButton *sender) {
            [self cellLoveButtonClick:sender];
        };
        return weekCell;
    } else {
        BCLOtherWeekDayRecordCollectionViewCell *otherWeekDayCell = [_weekLogCollectionView dequeueReusableCellWithReuseIdentifier:otherWeekDayCellName forIndexPath:indexPath];
        
        otherWeekDayCell.backgroundColor = [UIColor whiteColor];
        otherWeekDayCell.weekFoodImageView.image = [UIImage imageNamed:@"bcl_bg_log_everyday_food2"];
        otherWeekDayCell.everydayCaloriesLabel.text = @"2000千卡";
        otherWeekDayCell.loveButtonAction = ^(UIButton *sender) {
            [self cellLoveButtonClick:sender];
        };
        return otherWeekDayCell;
    }
    
}
- (void)cellLoveButtonClick:(UIButton *)btn {
    
    if(!_loveBtnSelected) {
        _loveBtnSelected = true;
        [btn setImage:[UIImage imageNamed:@"bcl_ic_log_week_aixin_selected"] forState:UIControlStateNormal];
    } else {
        _loveBtnSelected = false;
        [btn setImage:[UIImage imageNamed:@"bcl_ic_log_week_aixin"] forState:UIControlStateNormal];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

@end
