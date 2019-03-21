//
//  BCLCommunitySegmentView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/21.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLCommunitySegmentView.h"

@interface BCLCommunitySegmentView ()
{
    NSInteger _itemCounts;//控件的数目
    NSArray *_titleArray;
    float _itemWidth;
}


@end

@implementation BCLCommunitySegmentView

- (id) initWithFrame:(CGRect)frame withTitleArray:(NSArray *)array {
    if (self = [super initWithFrame:frame]) {
        _itemCounts = array.count;
        _titleArray = array;
        [self creatSegmentView];
    }
    return self;
}
- (void)creatSegmentView {
    //设置按钮的宽度
    _itemWidth = self.frame.size.width / _itemCounts;
    //循环创建按钮
    for (int i = 0; i < _itemCounts; i++) {
        UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake((i + 1) *_itemWidth/2, 0, _itemWidth/2, self.frame.size.height)];
        [self addSubview:button];
        
        //设置button的字
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        //设置button的字颜色
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置字体大小
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        //设置居中显示
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置tag值
        button.tag = 1000 + i;
        //添加点击事件
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //如果是第一个，默认被选中
        if (i == 0) {
            button.selected = YES;
        }
    }
    
    
    //添加一个select
    _selectImage = [[UIImageView alloc]initWithFrame:CGRectMake(_itemWidth / 2, self.frame.size.height - 2, _itemWidth / 2, 2)];
    _selectImage.image = [UIImage imageNamed:@"bcl_bg_community_segment_color_line"];
    [self addSubview:_selectImage];
}
-(void)buttonAction:(UIButton *)button{
    
    //当button被点击，所有的button都设为未选中状态
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *subButton = (UIButton*)view;
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:20];
        }
    }
    //然后将选中的这个button变为选中状态
    button.selected = YES;
    
    //通过当前的tag值设置select的位置
    NSInteger index = button.tag - 1000;
    [UIView animateWithDuration:0.3 animations:^{
        self->_selectImage.frame = CGRectMake((1 + index)*self->_itemWidth/2, _selectImage.frame.origin.y, self->_selectImage.frame.size.width, _selectImage.frame.size.height);
    }];
    
    _returnBlock(index);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
