//
//  BCLCommunityView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/20.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCLCommunitySegmentView;
@interface BCLCommunityView : UIView

@property (nonatomic, strong) UIScrollView *scrollerView;
@property(nonatomic ,strong) UITableView *circleTableView;
@property(nonatomic ,strong) UITableView *squreTableView;
@property (nonatomic, strong)BCLCommunitySegmentView *segmentView;

@end


