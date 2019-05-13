//
//  BCLCommunityView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/20.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLCommunityView.h"
#import "BCLCommunitySegmentView.h"
#import "BCLCommunityCircleTableViewCell.h"
#import "BCLCommunityRecipesView.h"
@interface BCLCommunityRecipesCell : BCLBaseTableViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end
@implementation BCLCommunityRecipesCell
- (void)setupUI {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height / 3)];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    
    NSInteger imageCount = 6;
    _scrollView.contentSize = CGSizeMake(k_screen_width * imageCount, k_screen_height / 3);
    for(int i = 0;i < imageCount; i++) {
        NSArray *recipesImage = [NSArray arrayWithObjects:@"bcl_bg_log_month_allCell",@"bcl_bg_log_everyday_food2",@"bcl_bg_log_everyday_food1",@"bcl_bg_log_month_allCell",@"bcl_bg_log_everyday_food2",@"bcl_bg_log_everyday_food1", nil];
        BCLCommunityRecipesView *recipesView = [[BCLCommunityRecipesView alloc]initWithFrame:CGRectMake(k_screen_width * i, 0, k_screen_width, k_screen_height/3) andRecipesImage:recipesImage[i]];
        [_scrollView addSubview:recipesView];
    }
}

@end

@interface BCLCommunityView ()<UITableViewDataSource, UIScrollViewDelegate>



@end

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@implementation BCLCommunityView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setSegmentView];
        
        _circleTableView = [self loadTableView];
        _squreTableView = [self loadTableView];
        
        _circleTableView.tag = 1;
        _squreTableView.tag = 2;
        
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.frame = CGRectMake(0, 104, KScreenW, KScreenH);
        _scrollerView.pagingEnabled = YES;
        _scrollerView.scrollEnabled = YES;
        _scrollerView.contentSize = CGSizeMake(KScreenW * 2, KScreenH);
        _scrollerView.bounces = YES;
        _scrollerView.delegate = self;
        
        [_scrollerView addSubview:_circleTableView];
        [_scrollerView addSubview:_squreTableView];
        
        _circleTableView.frame = CGRectMake(0, 0, KScreenW, KScreenH);
        _squreTableView.frame = CGRectMake(KScreenW, 0, KScreenW, KScreenH);
        [self addSubview:_scrollerView];
    }
    return self;
}
- (UITableView *)loadTableView
{
    UITableView  *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH) style:UITableViewStyleGrouped];
    tableView.showsVerticalScrollIndicator = NO;
    [tableView registerClass:[BCLCommunityCircleTableViewCell class] forCellReuseIdentifier:@"circleCell"];
    [tableView registerClass:[BCLCommunityRecipesCell class] forCellReuseIdentifier:@"recipescell"];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    tableView.dataSource = self;
    
    [self addSubview:tableView];
    return tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(tableView.tag == 1) {
        return 2;
    } else {
         return 2;
    }
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag == 1) {
        if(indexPath.section == 0) {
            BCLCommunityRecipesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipescell" forIndexPath:indexPath];
            if(!cell) {
                cell = [[BCLCommunityRecipesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recipescell"];
            }
            return cell;
        } else {
            BCLCommunityCircleTableViewCell *cell = [[BCLCommunityCircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"circleCell" cellType:@"imageTableViewCell"];
            return cell;
        }
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if(!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        return cell;
    }
    
}
- (void)setSegmentView {
    NSArray *titleArray = @[@"圈子",@"广场"];
    _segmentView = [[BCLCommunitySegmentView alloc]initWithFrame:CGRectMake(0, 64, KScreenW, 40) withTitleArray:titleArray];
    [self addSubview:_segmentView];
    
    [_segmentView setReturnBlock:^(NSInteger index) {
        switch (index) {
            case 0:
                [self.scrollerView setContentOffset:CGPointMake(self->_scrollerView.bounds.size.width*0, 0) animated:YES];
                break;
            case 1:{
                [self->_scrollerView setContentOffset:CGPointMake(self->_scrollerView.bounds.size.width*1, 0) animated:YES];
                break;
            }
                
            default:
                break;
        }
    }];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect frame = _segmentView.selectImage.frame;
    if(scrollView.contentOffset.x / KScreenW == 0) {
        [UIView animateWithDuration:0.1 animations:^{
            self->_segmentView.selectImage.frame = CGRectMake(KScreenW / 4, frame.origin.y, frame.size.width, frame.size.height);
        }];
    } else if(scrollView.contentOffset.x / KScreenW == 1){
        [UIView animateWithDuration:0.1 animations:^{
            self->_segmentView.selectImage.frame = CGRectMake(KScreenW / 2, frame.origin.y, frame.size.width, frame.size.height);
        }];
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
