//
//  BCLMonthTimeRecordView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/3.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMonthTimeRecordView.h"
#import "BCLMonthAllCaloriesCollectionViewCell.h"
#import "BCLMonthOfDayRecordCollectionViewCell.h"

static NSString *const monthAllDaysRecordCellName = @"monthAllDaysRecordCell";
static NSString *const monthOfDayRecordCellName = @"monthOfDayRecordCell";

@interface BCLMonthTimeRecordView ()<UICollectionViewDataSource>


@end

@implementation BCLMonthTimeRecordView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.itemSize = CGSizeMake(300, 200);
        
        _monthLogCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _monthLogCollectionView.dataSource = self;
        _monthLogCollectionView.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
        
        [_monthLogCollectionView registerClass:[BCLMonthAllCaloriesCollectionViewCell class] forCellWithReuseIdentifier:monthAllDaysRecordCellName];
        [_monthLogCollectionView registerClass:[BCLMonthOfDayRecordCollectionViewCell class] forCellWithReuseIdentifier:monthOfDayRecordCellName];
        
        [self addSubview:_monthLogCollectionView];
        
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
        BCLMonthAllCaloriesCollectionViewCell *cell = [_monthLogCollectionView dequeueReusableCellWithReuseIdentifier:monthAllDaysRecordCellName forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.dayTimeLabel.text = @"1月28日";
        return  cell;
    } else {
        BCLMonthOfDayRecordCollectionViewCell *cell
        = [_monthLogCollectionView dequeueReusableCellWithReuseIdentifier:monthOfDayRecordCellName forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.monthOfDayTimeLabel.text = [NSString stringWithFormat:@"Day%ld", (indexPath.row + 1)];
        cell.monthOfDayFoodImageView.image = [UIImage imageNamed:@"bcl_bg_log_everyday_food2"];
        cell.monthOfDayCaloriesLabel.text = @"2054千卡";
        return cell;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
