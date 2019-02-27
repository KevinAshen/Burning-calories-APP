//
//  BCLCommunityViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLCommunityViewController.h"
#import "BCLCommunityView.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface BCLCommunityViewController ()<UITableViewDelegate>
@property (nonatomic, strong) BCLCommunityView *communityView;
@end

@implementation BCLCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"社区";
    
    _communityView = [[BCLCommunityView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_communityView];
    
    _communityView.circleTableView.delegate = self;
    _communityView.squreTableView.delegate = self;
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag == 1) {
        return 200;
    }else {
        return 50;
    }
}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    if(scrollView.contentOffset.x / KScreenW == 0) {
//
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
