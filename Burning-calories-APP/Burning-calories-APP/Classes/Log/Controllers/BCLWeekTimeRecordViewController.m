//
//  BCLWeekTimeRecordViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/1.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLWeekTimeRecordViewController.h"
#import "BCLWeekTimeRecordView.h"

@interface BCLWeekTimeRecordViewController ()<UICollectionViewDelegate>
@property (nonatomic, strong)BCLWeekTimeRecordView *weekTimeRecordView;

@end

@implementation BCLWeekTimeRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"周记录";
    
    _weekTimeRecordView = [[BCLWeekTimeRecordView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_weekTimeRecordView];
    _weekTimeRecordView.weekLogCollectionView.delegate = self;
    // Do any additional setup after loading the view.
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        return CGSizeMake(300, 200);
    } else {
        return CGSizeMake(130, 150);
    }
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(section == 0) {
         return UIEdgeInsetsMake(40, 0, 0,0);
    } else {
         return UIEdgeInsetsMake(40, 40, 0, 40);
    }
}
//设置每个item的垂直间距
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 0) {
        return 0;
    } else {
        return 20;
    }
}
//设置每个item的水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
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
