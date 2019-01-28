//
//  BCLDayTimeRecordView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/28.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLDayTimeRecordView.h"
#import "BCLDayTimeRecordCollectionViewCell.h"
@interface BCLDayTimeRecordView ()<UICollectionViewDataSource>

@end

@implementation BCLDayTimeRecordView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        //初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置collectionView滚动方向
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //设置headerReferanceSize的尺寸大小
        layout.headerReferenceSize = CGSizeMake(self.frame.size.width, 5);
        layout.itemSize = CGSizeMake(280, 200);
        
        _everyDayLogCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _everyDayLogCollectionView.dataSource = self;
        _everyDayLogCollectionView.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
        
        [_everyDayLogCollectionView registerClass:[BCLDayTimeRecordCollectionViewCell class] forCellWithReuseIdentifier:@"everyDayCell"];
        [self addSubview:_everyDayLogCollectionView];
        
    }
    return self;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BCLDayTimeRecordCollectionViewCell *everyDayCell = [_everyDayLogCollectionView dequeueReusableCellWithReuseIdentifier:@"everyDayCell" forIndexPath:indexPath];
//    if(!everyDayCell) {
//        everyDayCell = [[BCLDayTimeRecordCollectionViewCell alloc]init];
//    }
    return  everyDayCell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
