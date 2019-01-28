//
//  BCLDayTimeRecordViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/28.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLDayTimeRecordViewController.h"
#import "BCLDayTimeRecordView.h"

@interface BCLDayTimeRecordViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong)BCLDayTimeRecordView *dayTimeRecordView;

@end

@implementation BCLDayTimeRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"今日";
    
    _dayTimeRecordView = [[BCLDayTimeRecordView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_dayTimeRecordView]; _dayTimeRecordView.everyDayLogCollectionView.delegate = self;
    
    // Do any additional setup after loading the view.
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(280, 200);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0,0);
}
//设置每个item的水平间距
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设置每个item的垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
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

@end
